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
	'tables' : [{
		'name' : {
			'type' : String
		},
		'available' : {
			'type' : Boolean
		}
	}]
}));

app.post('/restaurants', require('connect-multiparty')(), function (request, response, next) {
    'use strict';

    var restaurant;

    restaurant = new Restaurant({
		'name' : request.param('name'),
		'picture' : request.files.file.path,
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
    	
																	    	//aqui eu faço uma requisicao no file system (fs), pela funcao openSync
																	      	//ele retorna o conteundo do arquivo, flag r eh para eu somente ler.
    		
    	
    	 //quando eu preciso mandar o arquivo, e sendFile, sem ele eh somente send. ps o 200 e retornado com sucesso
    });
});


app.listen(8080);
