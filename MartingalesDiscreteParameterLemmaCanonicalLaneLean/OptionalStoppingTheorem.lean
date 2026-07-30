import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.StoppingTime

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure OptionalStoppingTheorem {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} (M : MartingaleProperty X) where
  stoppingTimes : (τ : StoppingTime B T F) × (σ : StoppingTime B T F)
  boundedCondition : ∀ (ω : B.carrier), τ.value ω ≤ σ.value ω ∧ σ.value ω ≤ maximalElement T
  equality : conditionalExpectation (X.value (σ.value)) (F.sigmaAlgebras (τ.value)) = X.value (τ.value)

def OptionalStoppingTheoremClosed {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (O : OptionalStoppingTheorem M) : Prop :=
  O.equality ∧ O.boundedCondition

-- evidence structure
structure OptionalStoppingTheoremEvidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (O : OptionalStoppingTheorem M) where
  boundedConditionClosed : O.boundedCondition
  equalityClosed : O.equality

theorem optional_stopping_theorem_closed_from_evidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} {M : MartingaleProperty X} (O : OptionalStoppingTheorem M) (E : OptionalStoppingTheoremEvidence O) : OptionalStoppingTheoremClosed O := by
  exact And.intro E.boundedConditionClosed E.equalityClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse