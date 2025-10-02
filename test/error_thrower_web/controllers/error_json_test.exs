defmodule ErrorThrowerWeb.ErrorJSONTest do
  use ErrorThrowerWeb.ConnCase, async: true

  test "renders 404" do
    assert ErrorThrowerWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ErrorThrowerWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
