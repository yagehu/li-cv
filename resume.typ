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

= Work

#yaml("work.yaml").filter(it => it.resume).map(experience-item).join(v(0.5em))

= Education

#yaml("education.yaml").map(edu-item).join(v(0.5em))
