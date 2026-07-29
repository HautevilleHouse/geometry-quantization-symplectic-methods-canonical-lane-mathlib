import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.MetaplecticCorrection

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure GuilleminSternbergResult (V : SymplecticVectorSpace) where
  gsQuantization : GeometricQuantizationData V
  gsCorrection : MetaplecticCorrection V
  commutativityCondition : ∀ f g : V.carrier → ℝ, gsQuantization.quantizationMap (f * g) = gsQuantization.quantizationMap f * gsQuantization.quantizationMap g

def GuilleminSternbergClosed (V : SymplecticVectorSpace) (G : GuilleminSternbergResult V) : Prop :=
  G.commutativityCondition

theorem guillemin_sternberg_closed (V : SymplecticVectorSpace) (G : GuilleminSternbergResult V) : GuilleminSternbergClosed V G := by
  exact G.commutativityCondition

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse