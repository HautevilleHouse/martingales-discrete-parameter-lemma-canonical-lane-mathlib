import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.FiltrationSpace

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingalePackage (M : FiltrationSpace) where
  process : Nat -> M.Omega -> ℝ
  adapted : Prop
  integrable : Prop
  martingaleProperty : Prop

structure MartingaleEvidence {M : FiltrationSpace} (P : MartingalePackage M) where
  adaptedClosed : P.adapted
  integrableClosed : P.integrable
  martingalePropertyClosed : P.martingaleProperty

def MartingaleClosed {M : FiltrationSpace} (P : MartingalePackage M) : Prop :=
  P.adapted ∧ P.integrable ∧ P.martingaleProperty

theorem martingale_closed_from_evidence {M : FiltrationSpace} (P : MartingalePackage M) (E : MartingaleEvidence P) : MartingaleClosed P := by
  exact And.intro E.adaptedClosed (And.intro E.integrableClosed E.martingalePropertyClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse