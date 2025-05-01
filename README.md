# CopyDocTest

This project is to test the Copy Doc functionality:
Couple of observations, that has nothing to do with my changes:
<!-- * `m:Orig` does not work correctly in the short function descriptions (but it does work in module descriptions)
* `t:special_value/0` does not work correctly in the short function descriptions -->
* `m:Orig2` does not work, even though it shoudl be locally scoped `m:Orig.Orig2` does work.
* Issue #2119 was reported

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `copy_doc_test` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:copy_doc_test, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/copy_doc_test>.

