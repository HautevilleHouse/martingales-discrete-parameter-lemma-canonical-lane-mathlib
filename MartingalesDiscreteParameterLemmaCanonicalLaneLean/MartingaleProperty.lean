import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.FiltrationSystem
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.IntegrableStochasticProcess

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingaleProperty {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} (X : IntegrableStochasticProcess B T F) where
  adaptedCondition : X.adapted
  integrabilityCondition : X.integrableEachTime
  martingaleEquality : ∀ (i j : T.indexType), T.order i j → conditionalExpectation (X.value j) (F.sigmaAlgebras i) = X.value i

def MartingalePropertyClosed {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} (M : MartingaleProperty X) : Prop :=
  M.martingaleEquality ∧ M.adaptedCondition ∧ M.integrabilityCondition

-- evidence structure
structure MartingalePropertyEvidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} (M : MartingaleProperty X) where
  adaptedConditionClosed : M.adaptedCondition
  integrabilityConditionClosed : M.integrabilityCondition
  martingaleEqualityClosed : M.martingaleEquality

theorem martingale_property_closed_from_evidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} {F : FiltrationSystem B T} {X : IntegrableStochasticProcess B T F} (M : MartingaleProperty X) (E : MartingalePropertyEvidence M) : MartingalePropertyClosed M := by
  exact And.intro E.adaptedConditionClosed (And.intro E.integrabilityConditionClosed E.martingaleEqualityClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse