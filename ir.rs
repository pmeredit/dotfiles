use std::collections::HashMap;

#[derive(Debug, Clone, PartialEq)]
enum Stage {
    Filter(Filter),
    Project(Project),
    GroupBy(GroupBy),
    Limit(i64),
    Offset(i64),
    //Set(Set),
    Source(Source),
}

#[derive(Debug, Clone, PartialEq)]
struct Reference {
    name: String,
}

#[derive(Debug, Clone, PartialEq)]
enum Source {
    Derived(Derived),
    Join(Join),
    Collection(Collection),
    Array(Array),
}

#[derive(Debug, Clone, PartialEq)]
struct Filter {
    matcher: Box<Expression>,
}

#[derive(Debug, Clone, PartialEq)]
struct Project {
    projected_expressions: Vec<AliasedExpression>,
}

#[derive(Debug, Clone, PartialEq)]
struct GroupBy {
    group_by_expressions: Vec<AliasedExpression>,
    aggregate_expressions: Vec<AliasedExpression>,
}

#[derive(Debug, Clone, PartialEq)]
struct Derived {
    stages: Vec<Stage>,
}

#[derive(Debug, Clone, PartialEq)]
struct Join {
    join_type: JoinType,
    left: Box<Source>,
    right: Box<Source>,
    on: Option<Expression>,
}


#[derive(Debug, Clone, PartialEq)]
enum JoinType {
    Left,
    Inner,
}

#[derive(Debug, Clone, PartialEq)]
struct Collection {
    collection: Reference,
}

#[derive(Debug, Clone, PartialEq)]
struct Array {
    array: Vec<Expression>,
}

#[derive(Debug, Clone, PartialEq)]
struct SubQueryStageExpression {
    correlated_references: Vec<Reference>,
}

#[derive(Debug, Clone, PartialEq)]
struct KVPair {
    key: String,
    value: Expression,
}

#[derive(Debug, Clone, PartialEq)]
enum Expression {
    Int(i32),
    Long(i64),
    Double(f64),
    Str(String),
    Document(Vec<KVPair>),
    Array(Vec<Expression>),
    BinExp(BinExp),
}

#[derive(Debug, Clone, PartialEq)]
struct BinExp {
    op: BinOp,
    left: Box<Expression>,
    right: Box<Expression>,
}

#[derive(Debug, Clone, PartialEq)]
enum BinOp {
    Plus,
    Mul,
    Sub,
    Div,
}

#[derive(Debug, Clone, PartialEq)]
struct AliasedExpression {
    expression: Expression,
    alias: String,
}

#[derive(Debug, Clone, PartialEq)]
enum Type {
    Unknown,
    Int,
    Long,
    Double,
    Str,
    Array(Box<Type>),
    Document(HashMap<String, Type>),
}

fn schema_infer(exp: &Expression) -> Result<Type, &'static str> {
     match exp {
         Expression::Int(_) => Ok(Type::Int),
         Expression::Long(_) => Ok(Type::Long),
         Expression::Double(_) => Ok(Type::Double),
         Expression::Str(_) => Ok(Type::Str),
         Expression::Document(d) => Ok({
                let mut hm = HashMap::new();
                for kv in d.iter() {
                    hm.insert(kv.key.clone(), schema_infer(&kv.value)?);
                }
                Type::Document(hm)
         }),
         Expression::Array(a) =>
             Ok(Type::Array(
                 Box::new(
                 a.iter().try_fold(Type::Unknown,
                        |acc, x| {
                            let current_schema = schema_infer(&x)?;
                            if acc != current_schema {
                                if acc == Type::Unknown {
                                    Ok(current_schema)
                                } else {
                                    // Actually this is probably ok, we'll just allow union types
                                    // this is just for testing purposes
                                    Err("Array types not consistent")
                                }
                            } else {
                                Ok(current_schema)
                            }
                        }
                     )?
                 )
             )),
         Expression::BinExp(_) => Ok(Type::Int),
     }
}

fn main() {
    println!("{:?}", AliasedExpression{ expression: Expression::Int(42), alias: "hello world".to_string() });
    let exp = Expression::Array(
        vec![Expression::Int(42), Expression::Int(45)]
    );
    println!("{:?}", schema_infer(&exp));
    let exp2 = Expression::Document(
        vec![
           KVPair{ key: "hello".to_string(), value: Expression::Int(42) },
           KVPair{ key: "world".to_string(), value: Expression::Double(42.0) },
        ]
    );
    println!("{:?}", schema_infer(&exp2));
}
