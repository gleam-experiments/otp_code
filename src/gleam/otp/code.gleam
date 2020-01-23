import gleam/atom.{Atom}
import gleam/dynamic.{Dynamic}

pub type UnknownApplication {
  UnknownApplication
};

external type Char;

external fn charlist_to_binary(List(Char)) -> String = "erlang" "list_to_binary";

external fn erl_priv_dir(Atom) -> List(Char) = "code" "priv_dir";

pub fn priv_dir(application: Atom) -> Result(String, UnknownApplication) {
  let path = erl_priv_dir(application)
  case path {
    [_ | _] -> Ok(charlist_to_binary(path))
    _ -> Error(UnknownApplication)
  }
}
