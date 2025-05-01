defmodule Delegate do
  @moduledoc """
  This delegates a couple of functions to `m:Orig`
  """

  # Note we can't specify a function header for a delegated function
  # Thus to get the correct parameter we need to specify it correctly in
  # the defdelegate definition.

  # implicit mfa
  @doc copy: true
  defdelegate local_link1(str), to: Orig

  # explicit mfa
  @doc copy: {Orig, :local_link2, 1}
  defdelegate local_link2(str), to: Orig

  # check that we use the correct function name
  @doc copy: true
  defdelegate local_link10(str), to: Orig, as: :local_link1

  # Ensure that we don't copy documentation on this function
  # by mistake
  def local_link4(_str), do: :ok

  # intentionally both a copy instruction and some documentation
  # This should lead to a warning.
  @doc copy: {Orig, :local_link1, 1}
  @doc """
  Some doc
  """
  def local_link40(_str), do: :ok

  # ensure other tags are preserved, like `since` and `deprecated`
  # Note: code in the deprecated text are not links
  @doc copy: {Orig, :local_link1, 1}
  @doc deprecated: "Use `local_link10/2` instead"
  @doc since: "0.0.1"
  defdelegate local_link11(str), to: Orig, as: :local_link1
end
