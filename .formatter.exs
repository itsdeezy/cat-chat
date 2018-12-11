[
  line_length: 80,
  import_deps: [:ecto, :phoenix],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"],
  locals_without_parens: [
    # cat_chat_web
    object: :*,
    resolve: :*,
    description: :*,
    import_types: 1,
    resolve_type: :*,
    field: :*,
    object: :*,
    connection: :*
  ]
]
