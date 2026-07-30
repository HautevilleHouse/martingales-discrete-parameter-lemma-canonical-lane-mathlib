import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure FiltrationSpace where
  Omega : Type u
  F : Omega -> Omega -- placeholder for sigma-algebra
  sigmaAlgebra : Prop
  sigmaAlgebraTerm : sigmaAlgebra

structure FiltrationSpaceEvidence (M : FiltrationSpace) where
  sigmaAlgebraClosed : M.sigmaAlgebra

def FiltrationSpaceClosed (M : FiltrationSpace) : Prop := M.sigmaAlgebra

theorem filtration_space_closed_from_evidence (M : FiltrationSpace) (E : FiltrationSpaceEvidence M) : FiltrationSpaceClosed M := by
  exact E.sigmaAlgebraClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse