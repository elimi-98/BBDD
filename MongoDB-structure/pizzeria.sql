CREATE DATABASE 'pizzeria'

use('pizzeria');db.createCollection('Botiga',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "direccio": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "carrer": {
            "bsonType": "string"
          },
          "num": {
            "bsonType": "int"
          },
          "codi_postal": {
            "bsonType": "int"
          },
          "localitat": {
            "bsonType": "string"
          },
          "provincia": {
            "bsonType": "string"
          }
        }
      }
    }
  }
} }});

use('pizzeria');db.createCollection('Client',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "cognom2": {
      "bsonType": "string"
    },
    "cognom1": {
      "bsonType": "string"
    },
    "direccio": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "carrer": {
            "bsonType": "string"
          },
          "num": {
            "bsonType": "int"
          },
          "codi_postal": {
            "bsonType": "int"
          },
          "localitat": {
            "bsonType": "string"
          },
          "provincia": {
            "bsonType": "string"
          }
        }
      }
    },
    "nom": {
      "bsonType": "string"
    },
    "telf": {
      "bsonType": "int"
    }
  }
} }});

use('pizzeria');db.createCollection('Comanda',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "id_botiga"
  ],
  "properties": {
    "productes": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "producte": {
            "bsonType": "array",
            "items": {
              "bsonType": "object",
              "properties": {
                "quantitat": {
                  "bsonType": "int"
                },
                "id": {
                  "bsonType": "int"
                }
              }
            }
          }
        }
      }
    },
    "id_botiga": {
      "bsonType": "objectId"
    },
    "id_producte": {
      "bsonType": "int"
    },
    "id_client": {
      "bsonType": "int"
    },
    "id_treballador": {
      "bsonType": "int"
    },
    "data_hora": {
      "bsonType": "date"
    },
    "entrega": {
      "enum": [
        "botiga",
        "domicili"
      ]
    },
    "preu_total": {
      "bsonType": "double"
    }
  }
} }});

use('pizzeria');db.createCollection('Producte',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "descripcio": {
      "bsonType": "string"
    },
    "preu": {
      "bsonType": "double"
    },
    "categoria": {
      "bsonType": "string"
    },
    "nom": {
      "bsonType": "string"
    },
    "tipus": {
      "enum": [
        "pizza",
        "hamburguesa",
        "beguda"
      ]
    },
    "imatge": {
      "bsonType": "symbol"
    }
  }
} }});

use('pizzeria');db.createCollection('treballador',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "id_",
    "id_botiga"
  ],
  "properties": {
    "cognom2": {
      "bsonType": "string"
    },
    "cognom1": {
      "bsonType": "string"
    },
    "id_botiga": {
      "bsonType": "objectId"
    },
    "id_": {
      "bsonType": "objectId"
    },
    "NIF": {
      "bsonType": "string"
    },
    "nom": {
      "bsonType": "string"
    },
    "telf": {
      "bsonType": "int"
    }
  }
} }});
