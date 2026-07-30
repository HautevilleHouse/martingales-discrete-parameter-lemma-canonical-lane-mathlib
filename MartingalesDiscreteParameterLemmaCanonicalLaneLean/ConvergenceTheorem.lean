import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleDefinition
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.DoobInequality

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure ConvergencePackage {M : FiltrationSpace} {P : MartingalePackage M} (D : DoobInequalityPackage P) where
  almostSureConvergence : Prop
  L1Convergence : Prop
  limitIsMartingale : Prop

structure ConvergenceEvidence {M : FiltrationSpace} {P : MartingalePackage M} {D : DoobInequalityPackage P} (C : ConvergencePackage D) where
  almostSureConvergenceClosed : C.almostSureConvergence
  L1ConvergenceClosed : C.L1Convergence
  limitIsMartingaleClosed : C.limitIsMartingale

def ConvergenceClosed {M : FiltrationSpace} {P : MartingalePackage M} {D : DoobInequalityPackage P} (C : ConvergencePackage D) : Prop :=
  C.almostSureConvergence ∧ C.L1Convergence ∧ C.limitIsMartingale

theorem convergence_closed_from_evidence {M : FiltrationSpace} {P : MartingalePackage M} {D : DoobInequalityPackage P} (C : ConvergencePackage D) (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.almostSureConvergenceClosed (And.intro E.L1ConvergenceClosed E.limitIsMartingaleClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse