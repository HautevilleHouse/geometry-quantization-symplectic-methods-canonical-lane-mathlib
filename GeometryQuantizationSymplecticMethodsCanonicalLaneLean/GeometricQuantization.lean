import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.PrequantumLineBundle
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.MetalinearStructure

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure GeometricQuantization (V : SymplecticVectorSpace) where
  prequantumBundle : PrequantumLineBundle V
  metalinearStructure : MetalinearStructure V
  hilbertSpace : Type u
  innerProduct : hilbertSpace → hilbertSpace → ℂ
  quantizationMap : (V.carrier → ℂ) → hilbertSpace
  prequantumClosed : PrequantumLineBundleClosed prequantumBundle
  metalinearClosed : MetalinearStructureClosed metalinearStructure
  hilbertSpaceComplete : Prop
  quantizationMapUnitary : Prop
  hilbertSpaceCompleteTerm : hilbertSpaceComplete
  quantizationMapUnitaryTerm : quantizationMapUnitary

structure GeometricQuantizationEvidence {V : SymplecticVectorSpace} (Q : GeometricQuantization V) where
  prequantumClosedEvidence : PrequantumLineBundleClosed Q.prequantumBundle
  metalinearClosedEvidence : MetalinearStructureClosed Q.metalinearStructure
  hilbertSpaceCompleteClosed : Q.hilbertSpaceComplete
  quantizationMapUnitaryClosed : Q.quantizationMapUnitary

def GeometricQuantizationClosed {V : SymplecticVectorSpace} (Q : GeometricQuantization V) : Prop :=
  PrequantumLineBundleClosed Q.prequantumBundle ∧
  MetalinearStructureClosed Q.metalinearStructure ∧
  Q.hilbertSpaceComplete ∧
  Q.quantizationMapUnitary

theorem geometric_quantization_closed_from_evidence {V : SymplecticVectorSpace}
    (Q : GeometricQuantization V) (E : GeometricQuantizationEvidence Q) :
    GeometricQuantizationClosed Q := by
  exact And.intro E.prequantumClosedEvidence (And.intro E.metalinearClosedEvidence (And.intro E.hilbertSpaceCompleteClosed E.quantizationMapUnitaryClosed))

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
