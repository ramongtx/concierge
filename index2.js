var Express, mongoose, app, Restaurant;

Express  = require('express');
mongoose = require('mongoose');

app = new Express();

app.use(Express.static(__dirname + '/pictures'));
app.use(Express.compress());
app.use(Express.urlencoded());
app.use(Express.json());
app.use(app.router);

mongoose.connect('mongodb://localhost:27017/consierge');

Restaurant = mongoose.model('Restaurant', new mongoose.Schema({
    'name' : {
        'type' : String
    },
    'picture' : {
        'type' : String
    },

    'coordinate': {
          'x' : {
            'type' : Number
          },
          'y' : {
            'type' : Number
          }
    },

    'tables' : [{
            'tableNumber' : {
                'type' : String
            },
            'tableStatus' : {
                'type' : Boolean
            },
            'tableNumberOfChairs': {
                'type': Number
            },
            'canBeConnected' : {
                'type': Boolean
            },                     //montar um metodo que verifica a disponibilidade das mesas a quais ela pode se conectar,
            'tableConnections' : {
                'type': Array
            },
            
            'interval' :{
                'minx' : {
                    'type' : Number
                },

                'maxx' : {
                    'type' : Number
                },

                'miny' : {
                    'type' : Number
                },

                'maxy' : {
                    'type' : Number
                }
            }
    }]
}));

app.post('/restaurants', require('connect-multiparty')(), function (request, response, next) {
    'use strict';

    var restaurant;

    restaurant = new Restaurant({
        'name' : request.param('name'),
        'picture' : request.files.file.path,
        'coordinate' : request.param('coordinate'),
        'tables' : request.param('tables')
    });

    restaurant.save(function (error) {
        if (error) { return next(error); }
        response.send(201);                     //201 eh criado com sucesso
    });
});

//essa parte do codigo dis que se na url tiver /restaurant, vai fazer a funcion que esta no call back
app.get('/restaurants', function (request, response, next) { //este next é para jogar o erro para a proxima camanda. a culpa nao é minha, manda outro tratar (hehe)
    'use strict';
                                 //este find vai pegar no mongodb todos os objetos que tiverem o objeto que esta no find, se nao tiver nenhum (obj como criterio) vai retornar todos     
    Restaurant.find(/*{name : request.param},*/ function (error, restaurants) {
        if (error) { return next(error); }
        response.send(200, restaurants);
    });
});
//quando eu quero pegar uma informacao que vem na url , eu devo colocar ":" o nome da variavel, e uso via request.params.lalalalalala, quando nao vir
//na url fica como esta ^  sem os dois pontos e request.param (detalhe no s que nao ha) 
app.get('/restaurants/:restaurantId/tables', function (request, response, next) {
    'use strict';

    Restaurant.findById(request.params.restaurantId, function (error, restaurant) {
        if (error) { return next(error); }
        if (!restaurant) { return response.send(404, new Error('restaurant not found')); }
        response.send(200, restaurant.tables);
    });
});

app.get('/restaurants/:restaurantId/picture', function (request, response, next) {
    'use strict';

    Restaurant.findById(request.params.restaurantId, function (error, restaurant) {
        if (error) { return next(error); }
        if (!restaurant) { return response.send(404, new Error('restaurant not found')); }
        
        response.sendfile(restaurant.picture);            
        
    });
});


app.listen(8080);