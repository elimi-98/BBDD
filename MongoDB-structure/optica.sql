CREATE DATABASE 'optica'

use('optica');db.createCollection('Client',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "id_client_recomanacio": {
      "bsonType": "int"
    },
    "mail": {
      "bsonType": "string"
    },
    "direccio": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "ciutat": {
            "bsonType": "string"
          },
          "carrer": {
            "bsonType": "string"
          },
          "num": {
            "bsonType": "int"
          },
          "codi_postal": {
            "bsonType": "int"
          },
          "pis": {
            "bsonType": "int"
          },
          "porta": {
            "bsonType": "int"
          },
          "pais": {
            "bsonType": "string"
          }
        }
      }
    },
    "telefon": {
      "bsonType": "int"
    },
    "data_registre": {
      "bsonType": "date"
    },
    "nom": {
      "bsonType": "string"
    },
    "cognom": {
      "bsonType": "string"
    }
  }
} }});

use('optica');db.createCollection('Proveidor',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "direccio": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "ciutat": {
            "bsonType": "string"
          },
          "carrer": {
            "bsonType": "string"
          },
          "num": {
            "bsonType": "int"
          },
          "codi_postal": {
            "bsonType": "int"
          },
          "pis": {
            "bsonType": "int"
          },
          "porta": {
            "bsonType": "int"
          },
          "pais": {
            "bsonType": "string"
          }
        }
      }
    },
    "telefon": {
      "bsonType": "int"
    },
    "NIF": {
      "bsonType": "int"
    },
    "fax": {
      "bsonType": "int"
    },
    "nom": {
      "bsonType": "string"
    }
  }
} }});

use('optica');db.createCollection('Ulleres',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "graduacio_esq": {
      "bsonType": "double"
    },
    "marca": {
      "bsonType": "string"
    },
    "graduacio_dret": {
      "bsonType": "double"
    },
    "muntura": {
      "enum": [
        "flotant",
        "pasta",
        "metàl·lica"
      ]
    },
    "preu": {
      "bsonType": "int"
    },
    "color_vidres": {
      "bsonType": "int"
    },
    "color_muntura": {
      "bsonType": "string"
    },
    "id_proveidor": {
      "bsonType": "int"
    }
  }
} }});

use('optica');db.createCollection('Ventes',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "data": {
      "bsonType": "date"
    },
    "empleat": {
      "bsonType": "string"
    },
    "id_client": {
      "bsonType": "int"
    }
  }
} }});
