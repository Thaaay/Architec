projeto = Project.first

if projeto
  # Limpa hotspots antigos para não duplicar
  projeto.hotspots.destroy_all

  # Cria 2 pontos de interesse
  projeto.hotspots.create!(
    title: "Mobiliário Premium",
    description: "Sofá assinado por designers italianos, couro legítimo.",
    pitch: -15.5,
    yaw: 25.0
  )

  projeto.hotspots.create!(
    title: "Iluminação Zenital",
    description: "Abertura no teto para entrada de luz natural controlada.",
    pitch: 40.0,
    yaw: -10.0
  )
  
  puts "Hotspots de teste criados para o projeto: #{projeto.title}"
else
  puts "Nenhum projeto encontrado. Crie um projeto no admin primeiro!"
end