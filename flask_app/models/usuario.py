from flask_app.config.mysqlconnection import connectToMySQL

class Usuario:
        
        def __init__(self, data):
            self.id = data.get('id')
            self.nombre = data.get('nombre')
            self.email = data.get('email')
            self.password = data.get('password')
            self.created_at = data.get('created_at')
            self.updated_at = data.get('updated_at')



        @classmethod
        def get_all(cls):
            query = "SELECT * FROM usuarios;"

            resultado_query = connectToMySQL('CinePedia').query_db(query)

            lista_usuarios = []

            for elemento in resultado_query:
                 lista_usuarios.append(cls(elemento))

                 return lista_usuarios


        @classmethod
        def save(cls,date):
            query = "INSERT INTO usuarios(nombre,apellido,email, password) VALUES (%(nombre)s,%(apellido)s,%(email)s, %(password)s);"
            result = connectToMySQL('CinePedia').query_db(query,date)
            return result
 


