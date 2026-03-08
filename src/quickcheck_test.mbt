///|
fn prop_sum_reverse_invariant(data : Array[Int]) -> Bool {
  sum(data~) == sum(data=data.rev())
}

///|
test "quickcheck sum reverse invariant" {
  @qc.quick_check_fn(prop_sum_reverse_invariant)
}
