import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.SymplecticVectorSpace
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.PrequantumLineBundle
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.Polarization
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.MetaplecticCorrection
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.KostantSouriauOperator

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure GeomQuantAdmissibleObject where
  symplecticVectorSpace : SymplecticVectorSpace
  symplecticEvidence : SymplecticVectorSpaceEvidence symplecticVectorSpace
  prequantumBundle : PrequantumLineBundle symplecticVectorSpace
  prequantumEvidence : PrequantumLineBundleEvidence prequantumBundle
  polarization : Polarization symplecticVectorSpace
  polarizationEvidence : PolarizationEvidence polarization
  metaplectic : MetaplecticCorrection polarization
  metaplecticEvidence : MetaplecticCorrectionEvidence metaplectic
  kostantSouriau : KostantSouriauOperator symplecticVectorSpace prequantumBundle
  kostantSouriauEvidence : KostantSouriauOperatorEvidence kostantSouriau

structure GeomQuantAdmissibleClass where
  object : GeomQuantAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

noncomputable def bridgeClosed (A : GeomQuantAdmissibleClass) : Prop :=
  SymplecticVectorSpaceClosed A.object.symplecticVectorSpace ∧
  PrequantumLineBundleClosed A.object.prequantumBundle ∧
  PolarizationClosed A.object.polarization ∧
  MetaplecticCorrectionClosed A.object.metaplectic ∧
  KostantSouriauOperatorClosed A.object.kostantSouriau

def gateClosed (A : GeomQuantAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedGeomQuantClosure (A : GeomQuantAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : GeomQuantAdmissibleClass) : bridgeClosed A := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ (And.intro ?_ ?_)))
  · exact symplectic_vector_space_closed_from_evidence A.object.symplecticVectorSpace A.object.symplecticEvidence
  · exact prequantum_line_bundle_closed_from_evidence A.object.prequantumBundle A.object.prequantumEvidence
  · exact polarization_closed_from_evidence A.object.polarization A.object.polarizationEvidence
  · exact metaplectic_correction_closed_from_evidence A.object.metaplectic A.object.metaplecticEvidence
  · exact kostant_souriau_operator_closed_from_evidence A.object.kostantSouriau A.object.kostantSouriauEvidence

theorem gate_from_admissible_class (A : GeomQuantAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

theorem constrained_geom_quant_endgame (A : GeomQuantAdmissibleClass) :
    ConstrainedGeomQuantClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
