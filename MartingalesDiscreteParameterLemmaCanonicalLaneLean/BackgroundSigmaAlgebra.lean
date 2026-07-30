import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure BackgroundSigmaAlgebra where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  sigmaAlgebraClosed : sigmaAlgebra.closedUnderCountableUnions ∧ sigmaAlgebra.closedUnderComplement ∧ sigmaAlgebra.containsEmpty

structure BackgroundSigmaAlgebraEvidence (B : BackgroundSigmaAlgebra) where
  closedUnderCountableUnionsClosed : B.sigmaAlgebraClosed.1
  closedUnderComplementClosed : B.sigmaAlgebraClosed.2.1
  containsEmptyClosed : B.sigmaAlgebraClosed.2.2

def BackgroundSigmaAlgebraClosed (B : BackgroundSigmaAlgebra) : Prop :=
  B.sigmaAlgebraClosed.1 ∧ B.sigmaAlgebraClosed.2.1 ∧ B.sigmaAlgebraClosed.2.2

theorem background_sigma_algebra_closed_from_evidence (B : BackgroundSigmaAlgebra) (E : BackgroundSigmaAlgebraEvidence B) : BackgroundSigmaAlgebraClosed B := by
  exact And.intro E.closedUnderCountableUnionsClosed (And.intro E.closedUnderComplementClosed E.containsEmptyClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse