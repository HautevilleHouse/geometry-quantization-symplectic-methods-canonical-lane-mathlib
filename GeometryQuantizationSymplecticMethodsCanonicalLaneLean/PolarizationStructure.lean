import canonicalLaneMathlib.AdmissibleClass
import GeometryQuantizationSymplecticMethods.SymplecticVectorSpace

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethods

structure PolarizationStructure where
  symplecticSpace : SymplecticVectorSpace
  lagrangianDistribution : Type u
  integrable : Prop
  leafSpace : Type v
  leafSmooth : Prop
  transversePolarization : Prop

structure PolarizationStructureEvidence (P : PolarizationStructure) where
  integrableClosed : P.integrable
  leafSmoothClosed : P.leafSmooth
  transversePolarizationClosed : P.transversePolarization

def PolarizationStructureClosed (P : PolarizationStructure) : Prop :=
  P.integrable ∧ P.leafSmooth ∧ P.transversePolarization

theorem polarization_structure_closed_from_evidence (P : PolarizationStructure) (E : PolarizationStructureEvidence P) : PolarizationStructureClosed P := by
  exact And.intro E.integrableClosed (And.intro E.leafSmoothClosed E.transversePolarizationClosed)

end GeometryQuantizationSymplecticMethods
end HautevilleHouse