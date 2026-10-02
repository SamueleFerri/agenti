//// Permutations in functional programming: member and permutations, in Scala

// member returns every element of the list paired with the rest of the list

def member[A](l: List[A]): List[(A, List[A])] = l match
  case Nil => Nil
  case a :: t =>
    (a, t) :: (for (a2, l2) <- member(t) yield (a2, a :: l2))

// permutations returns every permutation of the list

def permutations[A](l: List[A]): Iterable[List[A]] = l match
  case Nil => Iterable(List())
  case _ =>
     for
       (a, l2) <- member(l)
       p <- permutations(l2)
     yield a :: p

// Expressions to try
//
//   member(List(1, 2, 3))
//   permutations(List(1, 2, 3, 4))
//   permutations(List("a", "b", "c"))
//   permutations(List(4, 3, 2, 1))
