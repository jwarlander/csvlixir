defmodule TestHelper do
  @test_input """
    hi!
    1,really,simple,row
    foo,"quoted",bar
    a,b,"close quote at end of line"
    a,é,unicodè chars
    
    ,
    ,,
    another row,"""nasty:,""","has, comma","has ""quotes""",has 'single quotes'
    "has ""comma, in quotes""","has 'comma, in single quotes'","quotes "","" surrounding",,
    "odd ""number of"" double ""quotes","two, yes two, commas","two, ""commas, second"" in quotes",,
    simple,row,"internal ""quote",,
    "this row continues
    on the next line",hi!
    """

  @test_expected [
    ["hi!"],
    ["1", "really", "simple", "row"],
    ["foo", "quoted", "bar"],
    ["a", "b" ,"close quote at end of line"],
    ["a", "é", "unicodè chars"],
    [],
    ["", ""],
    ["", "", ""],
    ["another row", "\"nasty:,\"", "has, comma", "has \"quotes\"", "has 'single quotes'"],
    ["has \"comma, in quotes\"", "has 'comma, in single quotes'", "quotes \",\" surrounding", "", ""],
    ["odd \"number of\" double \"quotes", "two, yes two, commas", "two, \"commas, second\" in quotes", "", ""],
    ["simple", "row", "internal \"quote", "", ""],
    ["this row continues\non the next line", "hi!"]
  ]

  def test_input, do: @test_input
  def test_expected, do: @test_expected
end

ExUnit.start
