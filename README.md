# elm-SPA-practice

#### Named function

```js
add1 : Int -> Int -> Int // this is the function signature. Not required but clearer AND makes the intention of the function clearer
add1 : x y =
  x + y
```
In Elm all functions take exactly one argument and return a result. This result can be another function.

#### Type Variables
we can make this function generic by using type variables or stand-ins instead of specific types.
```js
indexOf : a -> List a -> Int
```
By replacing String with a, the signature now says that indexOf takes a value of any type a and a list of that same type a and returns an integer.

#### Union Types
