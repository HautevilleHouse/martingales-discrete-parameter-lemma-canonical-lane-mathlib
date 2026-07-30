import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleProperty

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure DoobMaximalInequality {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} (M : MartingaleProperty X) where
  boundConstant : ℝ
  boundConstantPositive : boundConstant > 0
  maximalInequality : ∀ (λ : ℝ), λ > 0 → ℙ (sup_{n∈T} |X.value n| ≥ λ) ≤ (boundConstant / λ) * 𝔼[|X.value (maximalElement T)|]
  maximalElementExists : ∃ (m : T.indexType), ∀ (n : T.indexType), T.order n m

def DoobMaximalInequalityClosed {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (D : DoobMaximalInequality M) : Prop :=
  D.boundConstantPositive ∧ D.maximalInequality ∧ D.maximalElementExists

-- evidence structure
structure DoobMaximalInequalityEvidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (D : DoobMaximalInequality M) where
  boundConstantPositiveClosed : D.boundConstantPositive
  maximalInequalityClosed : D.maximalInequality
  maximalElementExistsClosed : D.maximalElementExists

theorem doob_maximal_inequality_closed_from_evidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (D : DoobMaximalInequality M) (E : DoobMaximalInequalityEvidence D) : DoobMaximalInequalityClosed D := by
  exact And.intro E.boundConstantPositiveClosed (And.intro E.maximalInequalityClosed E.maximalElementExistsClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse