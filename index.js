/**
* Module dependencies.
*/
var express = require('express')
  , router = express.Router() 
  , http = require('http')
  , path = require('path');
//var methodOverride = require('method-override');
var app = express();
var mysql      = require('mysql');
var bodyParser=require("body-parser");
var session = require('express-session')
var connection = mysql.createConnection({
              host     : 'localhost',
              user     : 'root',
              password : '',
              database : 'gate'
            });

 
connection.connect();
 
global.db = connection;
 
// all environments

app.set('port', process.env.PORT || 8080);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

app.use(
	session({
		secret: "user session"
	})
)

app.get('/', function (req, res) {
  res.render('index', {});
});
app.get('/signup', function(req, res){
   res.render('signup');
});
app.get('/login', function(req, res){
   res.render('login');
});

app.post('/login', function (req, res) {

	  var post  = req.body;
	  var user_id = post['user_id']
	  var user_pass = post['user_pass']
	  var gate_id = post['gate_id']
	  // console.log(nrp,password);

	  agent.post('localhost:3000/login')
	  	.send({
	  		user_id : user_id,
	  		user_pass : user_pass
	  		gate_id : gate_id
	  	})
	  	.then(
	  		(response) => {
	  			if (response.status == 200) {
	  				res.render('logged_in.ejs')
	  			}
	  	})
	  	.catch(
	  		(err) => {
	  			console.log(err)
	  		}
  		)
	  
});

app.post('/signup', function(req, res) {
	  var post  = req.body;
	  var user_id = post['user_id']
	  var user_name= post['user_name']
	  var user_pass= post['user_pass']
	  var user_group= post['user_group']
	  
	  agent.post('localhost:3000/signup')
	  	.send({
	  		user_id : user_id,
	  		user_name : user_name,
	  		user_pass : user_pass,
	  		user_group : user_group
	  	})
	  	.then(
	  		(response) => {
	  			if (response.status == 201) {
	  				res.render('regis_success.ejs')
	  			}
	  		})
	  	.catch(
	  		(err)=> {
	  			console.log(err)	
	  		}
  		)	
});



//Middleware
app.listen(3001, () => console.log('Server running on http://localhost:3001/'));