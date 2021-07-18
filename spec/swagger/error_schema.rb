module ErrorsSchema
  NOT_FOUND = {
    type: 'object',
    properties: {
      status: { type: 'string', description: 'Estado' },
      message: { type: 'string', description: 'Mensaje o descripción' }
    }
  }.freeze

  UNPROCESSABLE_ENTITY = {
    type: 'object',
    properties: {
      status: { type: 'string', description: 'Estado' },
      message: { type: 'string', description: 'Mensaje o descripción' },
      errors: {
        type: 'array',
        description: 'Mensajes de error',
        items: {
          type: 'string'
        }
      }
    }
  }.freeze
end
