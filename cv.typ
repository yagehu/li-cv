#import "lib.typ": conf, edu-item, experience-item

#set page(
  paper: "us-letter",
  margin: 1in,
)
#set document(title: [Di Li])

#show: conf.with()

#title()
#align(center, [
  #link("itdili65@gmail.com") | 650-513-9295
])

= Highlight

- Accomplished Control Engineer with over 20 years of experience in
  the design and implementation of advanced automation systems.
- Successfully led more than 50 projects encompassing
  high-performance machinery, vision-guided robotics,
  and integrated production lines.
- Possesses deep, comprehensive expertise across control technologies,
  including software/hardware architecture, industrial fieldbus protocols,
  logic/motion/process control, machine vision, IIoT, and AI-driven
  manufacturing solutions.

= Industry Experience

#yaml("work.yaml").filter(it => it.resume).map(experience-item).join(v(0.5em))

= Academic Experience

#yaml("academic-experience.yaml").filter(it => it.resume).map(experience-item).join(v(0.5em))

= Education

#yaml("education.yaml").map(edu-item).join(v(0.5em))

= Honors and Contributions

- Received 8 prestigious innovation awards from industry and academia.
- Member of top-level expert group in China that provides consultancy services
  for government and industry.
- 50+ patents.
- \~150 papers in smart manufacturing, including highly cited papers.
  #link("https://www.researchgate.net/profile/Di-Li-15")
- Most productive author in industry 4.0 based on third-party evaluations.
