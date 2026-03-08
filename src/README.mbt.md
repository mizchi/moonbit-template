# mizchi/lib

MoonBit template module.

## Package

- `mizchi/lib`

## Quick Example

```mbt check
///|
test {
  inspect(fib(10), content="89")
  inspect(sum(data=[1, 2, 3, 4, 5]), content="15")
}
```

## Included Examples

- Unit tests in `lib_test.mbt`
- Property-based tests in `quickcheck_test.mbt`
- Benchmarks in `lib_bench.mbt`

## Recommended Reading

- [MoonBit 0.8.0 Released](https://www.moonbitlang.com/updates/moonbit-0-8-0-release)
- [moonbitlang/quickcheck](https://github.com/moonbitlang/quickcheck)
