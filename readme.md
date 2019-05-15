- run : npm run serve

- localhost:3000 / 10.151.33.4:3000

# API Documentation

## Login

### Login (`POST` `/login`)

- Parameters:
	- `gate_id`: `STRING`
	- `user_id`: `STRING`
	- `user_pass`: `STRING`
	

## Gate

### Gate List (`GET` `/gates`)

- Query Parameters
	- None

### Create Gate (`POST` `/creategate`)

- Parameters:
	- `gate_id`: `INT`
	- `gate_name`: `STRING`

### Gate Details (`GET` `/gate/:gate_id`)

- Path Parameters:
	- `:gate_id`: `STRING` 

### Delete Gate (`DELETE` `/gate/:gate_id`)

- Path Parameters:
	- `:gate_id`: `STRING` 
	
	
## User

### User List (`GET` `/users`)

- Query Parameters
	- None

### Create User (`POST` `/auser`)

- Parameters:
	- `user_id`: `STRING`
	- `user_name`: `STRING`
	- `user_pass`: `STRING`
	- `user_group`: `STRING`

### User Details (`GET` `/users/:user_id`)

- Path Parameters:
	- `:user_id`: `STRING`

### Delete User (`DELETE` `/user/:user_id`)

- Path Parameters:
	- `:user_id`: `STRING`





