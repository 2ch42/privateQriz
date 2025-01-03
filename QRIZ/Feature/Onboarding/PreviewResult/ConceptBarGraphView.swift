//
//  ConceptBarGraphView.swift
//  QRIZ
//
//  Created by ch on 12/29/24.
//

import SwiftUI

struct ConceptBarGraphView: View {
    
    @StateObject var previewConceptsData: PreviewConceptsData
    
    var body: some View {
        VStack(spacing: 8) {
            
            Text("총 문제 개수")
                .font(.system(size: 18))
                .foregroundColor(.coolNeutral500)
            
            Text("20개")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.customBlue500)
            
            if previewConceptsData.incorrectCountDataArr.count > 1 {
                BarGraphsView()
                    .environmentObject(previewConceptsData)
            }
            
            Spacer()
            
            if previewConceptsData.incorrectCountDataArr.count > 0 {
                IncorrectRankView(rank: previewConceptsData.incorrectCountDataArr[0].id, topic: previewConceptsData.incorrectCountDataArr[0].topic, incorrectNum: previewConceptsData.incorrectCountDataArr[0].incorrectCount)
            }
            
            if previewConceptsData.incorrectCountDataArr.count > 1 {
                IncorrectRankView(rank: previewConceptsData.incorrectCountDataArr[1].id, topic: previewConceptsData.incorrectCountDataArr[1].topic, incorrectNum: previewConceptsData.incorrectCountDataArr[1].incorrectCount)
            }
            
            if previewConceptsData.incorrectCountDataArr.count > 2 {
                HStack(spacing: 8) {
                    Text("\(previewConceptsData.incorrectCountDataArr[2].topic)")
                        .font(.system(size: 14))
                        .foregroundColor(.coolNeutral500)
                    
                    Spacer()
                    
                    Text("\(previewConceptsData.incorrectCountDataArr[2].incorrectCount)문제")
                        .font(.system(size: 16))
                        .foregroundColor(.coolNeutral500)
                }
            }
            
            if previewConceptsData.incorrectCountDataArr.count > 3 {
                VStack(spacing: 4) {
                    ForEach(1..<4) { _ in
                        Circle()
                            .foregroundColor(.coolNeutral100)
                            .frame(width: 4, height: 4)
                    }
                }
            }
        }
        .background(.white)
        .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
    }
}

#Preview {
    ConceptBarGraphView(previewConceptsData: PreviewConceptsData())
}
