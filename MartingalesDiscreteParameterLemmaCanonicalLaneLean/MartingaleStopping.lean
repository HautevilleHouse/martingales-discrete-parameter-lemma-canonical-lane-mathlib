import MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleDefinition

/-!
# Stopping Time and Optional Stopping Package
-/

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingaleStoppingPackage {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) where
  stoppedProcess : ℕ → Ω → E
  optionalStoppingTheorem : Prop
  boundedStopping : Prop
  almostSureConvergence : Prop

structure MartingaleStoppingEvidence {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : MartingaleStoppingPackage M) where
  stoppedProcessMeasurable : ∀ (τ : StoppingTime ℱ), Measurable (S.stoppedProcess τ)
  optionalStoppingClosed : S.optionalStoppingTheorem
  boundedStoppingClosed : S.boundedStopping
  almostSureConvergenceClosed : S.almostSureConvergence

def MartingaleStoppingClosed {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : MartingaleStoppingPackage M) : Prop :=
  S.optionalStoppingTheorem ∧ S.boundedStopping ∧ S.almostSureConvergence

theorem martingale_stopping_closed_from_evidence {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : MartingaleStoppingPackage M) (E' : MartingaleStoppingEvidence M S) : MartingaleStoppingClosed M S := by
  exact And.intro E'.optionalStoppingClosed (And.intro E'.boundedStoppingClosed E'.almostSureConvergenceClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse