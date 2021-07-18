module AdminSchema
    OBJECT = {
      type: 'object',
      properties: {
        id: { type: 'integer', description: 'ID' },
        name: { type: 'string', description: 'Nombre del Administrador' },
        user: { type: 'string', description: 'Nick del Administrador' },
        created_at: { type: :string, format: 'date-time', description: 'Fecha de creación' },
        updated_at: { type: :string, format: 'date-time', description: 'Fecha de actualización' }
      },
      required: [:id]
    }.freeze
end