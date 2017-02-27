## MathEd



We like to write Σ, not Sigma. A problem that arises is the input of such symbols with our keyboard.

Here's a small text editor that simplifies input of Unicode symbols by replacing for example PROD with ∏ after space is pressed just after that word has been entered.

The same works for a wide list of symbols. Here are two examples:

```
fact(n) = PROD [i <- 1:n] i
```
will be transformed into

```
fact(n) = ∏ [i ← 1:n] i
```

And

```
omega =/= psi DOT pi ^2 IFF omega EQUIV A _2 OR EXISTS x IN NN : x GE 42
```
will be transformed into

```
ω ≠ ψ · π² ⇔ ω ≡ A₂ ∨ ∃ x ∈ ℕ: x ≥ 42
```
Note that you have to delete the spaces before your sub/superscripts.

[Download the jar file!](https://broxp.lima-city.de/bin/mathed.png)