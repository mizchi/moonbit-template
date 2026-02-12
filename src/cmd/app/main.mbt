///|
let version = "0.1.0"

///|
fn main {
  let args = @sys.get_cli_args()[1:].to_array()
  match args {
    ["--version" | "-v", ..] => println(version)
    ["--help" | "-h", ..] => print_usage()
    [.. rest] => run(rest.to_array())
  }
}

///|
fn print_usage() -> Unit {
  let usage =
    #|Usage: app [options] [args...]
    #|
    #|Options:
    #|  -h, --help     Show this help message
    #|  -v, --version  Show version
  println(usage)
}

///|
fn run(args : Array[String]) -> Unit {
  let n = match args {
    [s, ..] => @strconv.parse_int(s) catch { _ => 10 }
    _ => 10
  }
  println("fib(\{n}) = \{@lib.fib(n)}")
}
