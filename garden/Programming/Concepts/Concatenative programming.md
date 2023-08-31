# Concatenative programming

In a concatenative language, every expression is a function and functions are composed by being listed one after another --- concatenated. So something like

$$
f(g(h(x)))
$$
might be represented as

```forth
x h g f
```

This is in contrast with an [applicative programming language](Programming/Concepts/Applicative%20programming.md), where it might look like

```python
f(g(h(x)))
```

Typically concatenative languages are stack-based, with `x` denoting the function "push the value $x$ onto the stack".
## Examples

[Forth](garden/Programming/Languages/Forth.md) is a concatenative language, as is Joy. And so is the typesetting language PostScript, weirdly.