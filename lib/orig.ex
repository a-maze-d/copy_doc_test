defmodule Orig do
  @moduledoc """
    This has an embedded module `m:Orig.Orig2`?
  """
  import Imported
  # import Kernel, except: [or: 2]

  defmodule Orig2 do
    @moduledoc """
    An embedded module
    """

  end

  @typedoc """
  Not really used, but still defined here
  """
  @type special_values :: :none | :all | :some

  @doc """
  This is a callback link that needs to be implemented by other parties
  """
  @callback callback_link1(String.t()) :: :ok

  @doc """
  All of those links should get rewritten in the delegate
  functions that copy the documentation:

  * `local_link2/1` (should become `Orig.local_link2/1`)
  * `c:callback_link1/1` (callback should become `c:Orig.callback_link1/1`)
  * `local_link3/1` (local function in Orig, but not in Delegate, should become `Orig.local_link3/1`)
  * `t:special_values/0` (typespec should become `t:Orig.special_values/0`)
  """
  @spec local_link1(String.t()) :: :ok
  def local_link1(_str) do
    :ok
  end

  @doc """
  None of those should be rewritten links:

  * `:local_link1` (just an atom, not even a link)
  * `local_link4/1` (local function in Delegate, but not in Orig)
  * `Orig.local_link2(_str)` (just some code, not even a link)
  * `Kernel.and/2` (function in other modules)
  * `and/2` (Kernel modules with the implicit module name)
  * `imported_link/1` (an imported function, but it requires a full qualifier, not even a link)
  * `Imported.imported_link/1` (now with full qualifier it beomes a link, but no need to rewrite)
  * `m:Orig2` (not fully qualified, not even a link)
  * `m:Orig.Orig2` (now fully qualified and should be a link, but does not need rewriting)

  For this function we do also define a function header, but that shouldn't change anything
  in the Delegate documentation.
  """
  @spec local_link2(String.t()) :: :ok
  def local_link2(some_string)
  def local_link2(str) do
    imported_link(str)
  end

  @doc """
  This function is not delegated but is getting referenced
  """
  def local_link3(_str) do
    :ok
  end

  @doc """
  This is a normal function
  """
  def local_link4(_str) do
    :ok
  end

# Both of the following don't seem to be possible, the compiler rejects it.
# It was an attempt to try to hide Kernel functions
  # @doc """
  # Stupid idea, but let's define an "or/2" function
  # """
  # def or(str1, str2) do
  #   :ok
  # end
  #
  # @doc """
  # And let's define a and/3 function
  # """
  # def and(str1, str2, str3) do
  #   :ok
  # end

  @doc """
  This is a function with some references that will end up the summary. It
  demonstrates that no links are created and `local_link1/1`, `c:callback_link1/1`,
  and `t:special_values/0` look strange. But this has nothing to do with the copy
  functionality introduced here.
  """
  def local_link5(_str) do
    :ok
  end
end
