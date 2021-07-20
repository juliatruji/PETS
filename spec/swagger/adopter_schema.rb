module AdopterSchema
    OBJECT = {
      type: 'object',
      properties: {
        id: { type: 'integer', description: 'ID del Adoptante' },
        name: { type: 'string', description: 'Nombre del adoptante' },
        dni: { type: 'string', description: 'DNI del adoptante' },
        address: { type: 'string', description: 'Dirección del adoptante' },
        cel: { type: 'string', description: 'Celular del adoptante' },
        age: { type: 'integer', description: 'Edad' },
        created_at: { type: :string, format: 'date-time', description: 'Fecha de creación' },
        updated_at: { type: :string, format: 'date-time', description: 'Fecha de actualización' },
        pets: {
          type: 'array',
          description: 'Lista de Perros Adoptados',
          items: {
            pet: { '$ref': '#/components/schemas/pet' },
          }
        },
      },
      required: [:id]
    }.freeze
end