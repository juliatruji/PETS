module PetSchema
    OBJECT = {
      type: 'object',
      properties: {
        id: { type: 'integer', description: 'ID' },
        name: { type: 'string', description: 'Nombre' },
        race: { type: 'string', description: 'Raza' },
        gender: { type: 'string', description: 'Sexo' },
        color: { type: 'string', description: 'Color' },
        sterilized: { type: :boolean, description: '¿Esterilizado?' },
        size: { type: :string, description: 'Tamaño' },
        image: { type: :string, description: 'Imagen' },
        adoption_status: { type: :boolean, description: '¿Adoptado?' },
        created_at: { type: :string, format: 'date-time', description: 'Fecha de creación' },
        updated_at: { type: :string, format: 'date-time', description: 'Fecha de actualización' }
      },
      required: [:id]
    }.freeze
end