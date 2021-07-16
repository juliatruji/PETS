module AdoptionSchema
    OBJECT = {
      type: 'object',
      properties: {
        id: { type: 'integer', description: 'ID' },
        date: { type: 'string', description: 'Fecha de adopcion' },
        created_at: { type: :string, format: 'date-time', description: 'Fecha de creación' },
        updated_at: { type: :string, format: 'date-time', description: 'Fecha de actualización' },
        pet: { '$ref': '#/components/schemas/pet' },
        adopter: { '$ref': '#/components/schemas/adopter' }
      },
      required: [:id]
    }.freeze
end