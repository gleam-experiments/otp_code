import gleam/atom
import gleam/expect
import gleam/result
import gleam/otp/code

pub fn priv_dir_test() {
  "gleam_otp_code"
  |> atom.create_from_string
  |> code.priv_dir
  |> result.is_ok
  |> expect.true

  "dunno"
  |> atom.create_from_string
  |> code.priv_dir
  |> result.is_error
  |> expect.true
}
