import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.GeometricQuantization

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure KostantSouriauResult (V : SymplecticVectorSpace) where
  prequantumLineBundle : PrequantumLineBundle V
  momentMap : V.carrier → (V.carrier → ℝ)
  equivarianceCondition : ∀ x y : V.carrier, momentMap x (momentMap y) = momentMap (x + y)

def KostantSouriauClosed (V : SymplecticVectorSpace) (K : KostantSouriauResult V) : Prop :=
  K.equivarianceCondition

theorem kostant_souriau_closed (V : SymplecticVectorSpace) (K : KostantSouriauResult V) : KostantSouriauClosed V K := by
  exact K.equivarianceCondition

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse