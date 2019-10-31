fn fizzbuzz() -> impl Iterator<Item=String> {
  (0..)
    .zip((0..3).cycle())
    .zip((0..5).cycle())
    .map(|((n, n3), n5)| {
      match (n3, n5) {
       (0, 0) => "fizzbuzz".into(),
       (0, _) => "fizz".into(),
       (_, 0) => "buzz".into(),
       _ => format!("{}", n),  
      }
    })
}

fn main() {
  fizzbuzz().skip(1).take(100).for_each(|s| println!("{}", s))
}
