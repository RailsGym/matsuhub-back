ActiveRecord::Base.transaction do
  if User.count.zero?
    User.create!(provider: 'email', uid: 'test@example.com', name: 'yamada', email: 'test@example.com', password: 'password')
  end

  if Area.count.zero?
    Area.create!(area_type: 'purpose', area_type_text: '目的', description: 'われわれはなぜこの事業をやるのか？')
    Area.create!(area_type: 'vision', area_type_text: 'ビジョン', description: '中長期的に顧客どういう状況になってもらいたいか？')
    Area.create!(area_type: 'solution', area_type_text: '実現手段', description: '提案価値を実現するのに必要な手段とは何か？')
    Area.create!(area_type: 'superiority', area_type_text: '優位性', description: '提案価値や実現手段の提供に貢献するリソース(資産)が何かあるか？')
    Area.create!(area_type: 'indicator', area_type_text: '評価指標', description: 'どうなればこの事業が進捗していると判断できるのか？(指標と基準値)')
    Area.create!(area_type: 'value', area_type_text: '提案価値', description: 'われわれは顧客をどんな解決状態にするのか？(何ができるようになるのか)')
    Area.create!(area_type: 'explicit_problem', area_type_text: '顕在課題', description: '顧客が気づいている課題に何があるか？')
    Area.create!(area_type: 'implicit_problem', area_type_text: '潜在課題', description: '多くの顧客が気づけていない課題、解決を諦めている課題に何があるか？')
    Area.create!(area_type: 'substitute', area_type_text: '代替手段', description: '課題を解決するために顧客が現状とっている手段に何があるか？(さらに現状手段への不満はあるか)')
    Area.create!(area_type: 'channel', area_type_text: 'チャネル', description: '状況にあげた人たちに出会うための手段は何か？')
    Area.create!(area_type: 'situation', area_type_text: '状況', description: 'どのような状況にある顧客が対象なのか(課題が最も発生する状況とは？)')
    Area.create!(area_type: 'trend', area_type_text: '傾向', description: '同じ状況にある人が一致して行うことはあるか？')
    Area.create!(area_type: 'profit', area_type_text: '収益モデル', description: 'どうやって儲けるのか？')
    Area.create!(area_type: 'market', area_type_text: '想定する市場と規模', description: '対象となる市場の規模感は？')
  end
end