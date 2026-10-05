from flask_app.config.mysqlconnection import connectToMySQL

class Usuario:
        
        def __init__(self, data):
            self.id = data.get('id')
            self.nombre = data.get('nombre')
            self.email = data.get('email')
            self.password = data.get('password')
            self.created_at = data.get('created_at')
            self.updated_at = data.get('updated_at')