-- ============================================
-- SQL Query to Update Biography for ALL Artists
-- ============================================
-- This script provides UPDATE statements to fill in Biography fields for all artists
-- Includes biographies for major artists and a template for others

USE [TemplateJwtProjectDb]
GO

-- ============================================
-- PART 1: Major Artists with Detailed Biographies
-- ============================================

UPDATE [dbo].[Artist]
SET [Biography] = CASE [ArtistId]
    -- Rock Legends
    WHEN 1 THEN N'Queen is a British rock band formed in London in 1970. The band consists of Freddie Mercury (vocals, piano), Brian May (guitar, vocals), Roger Taylor (drums, vocals), and John Deacon (bass). Known for their theatrical performances and genre-spanning music, their hits include "Bohemian Rhapsody", "We Will Rock You", and "We Are the Champions".'
    WHEN 2 THEN N'Eagles is an American rock band formed in Los Angeles in 1971. Known for their country rock sound and harmonies, the band has sold over 150 million records worldwide. Their album "Hotel California" is one of the best-selling albums of all time. Key members include Glenn Frey, Don Henley, Joe Walsh, and Timothy B. Schmit.'
    WHEN 3 THEN N'Deep Purple is an English rock band formed in Hertfordshire in 1968. Pioneers of heavy metal and modern hard rock, they are known for "Smoke on the Water", "Highway Star", and "Child in Time". The classic lineup included Ritchie Blackmore, Ian Gillan, Roger Glover, Jon Lord, and Ian Paice.'
    WHEN 4 THEN N'Led Zeppelin was an English rock band formed in London in 1968. Considered one of the most influential rock bands in history, they pioneered hard rock and heavy metal. The band consisted of Robert Plant, Jimmy Page, John Paul Jones, and John Bonham. Their catalog includes "Stairway to Heaven", "Kashmir", and "Whole Lotta Love".'
    WHEN 5 THEN N'Meat Loaf (1947-2022) was an American singer and actor known for his powerful voice and theatrical live performances. His album "Bat Out of Hell" is one of the best-selling albums worldwide. Collaborating with songwriter Jim Steinman, he created epic rock operas. Notable songs include "Paradise by the Dashboard Light" and "I''d Do Anything for Love".'
    WHEN 6 THEN N'The Beatles were an English rock band formed in Liverpool in 1960. Consisting of John Lennon, Paul McCartney, George Harrison, and Ringo Starr, they are regarded as the most influential band of all time. Their innovative music and cultural impact during the 1960s revolutionized popular music. Hits include "Hey Jude", "Let It Be", and "Yesterday".'
    WHEN 7 THEN N'John Lennon (1940-1980) was an English singer, songwriter, and peace activist. As co-founder of The Beatles, he formed one of the most successful songwriting partnerships with Paul McCartney. His solo career produced classics like "Imagine", "Instant Karma!", and "Give Peace a Chance".'
    WHEN 8 THEN N'The Rolling Stones are an English rock band formed in London in 1962. One of the most enduring and influential bands in rock history, key members include Mick Jagger and Keith Richards. Known for blues-influenced rock, their hits include "Satisfaction", "Paint It Black", "Sympathy for the Devil", and "Start Me Up".'
    WHEN 9 THEN N'Simon & Garfunkel were an American folk rock duo consisting of singer-songwriter Paul Simon and singer Art Garfunkel. Formed in 1956, they achieved massive success in the 1960s with harmonious vocal arrangements. Classic songs include "The Sound of Silence", "Mrs. Robinson", "Bridge Over Troubled Water", and "The Boxer".'
    WHEN 10 THEN N'Procol Harum is an English rock band formed in 1967. Best known for their 1967 hit "A Whiter Shade of Pale", one of the most played songs in history. The band blended rock with classical and R&B influences, featuring Gary Brooker on vocals and piano.'
    WHEN 11 THEN N'The Doors were an American rock band formed in Los Angeles in 1965. Led by charismatic vocalist Jim Morrison, the band''s psychedelic rock sound featured Ray Manzarek''s keyboards prominently. Classic songs include "Light My Fire", "Riders on the Storm", "Break On Through", and "The End".'
    WHEN 12 THEN N'The Animals were an English rhythm and blues and rock band formed in Newcastle in 1963. Known for their gritty sound and Eric Burdon''s powerful vocals, they are famous for "The House of the Rising Sun", "Don''t Let Me Be Misunderstood", and "We Gotta Get Out of This Place".'
    WHEN 13 THEN N'Billy Joel is an American singer-songwriter and pianist. Since 1973, he has released numerous hit albums and is one of the best-selling music artists. Known for his storytelling lyrics and melodic piano rock, his hits include "Piano Man", "Uptown Girl", "We Didn''t Start the Fire", and "Just the Way You Are".'
    WHEN 14 THEN N'The Moody Blues are an English rock band formed in Birmingham in 1964. Pioneers of art rock and progressive rock, they are known for their fusion of rock with orchestral music. The album "Days of Future Passed" was groundbreaking. Hits include "Nights in White Satin" and "Tuesday Afternoon".'
    WHEN 15 THEN N'ABBA is a Swedish pop group formed in Stockholm in 1972. Consisting of Agnetha Fältskog, Björn Ulvaeus, Benny Andersson, and Anni-Frid Lyngstad, they became one of the most commercially successful acts in music history. Hits include "Dancing Queen", "Mamma Mia", "Waterloo", and "Take a Chance on Me".'
    WHEN 16 THEN N'Pink Floyd were an English rock band formed in London in 1965. Known for their philosophical lyrics, sonic experimentation, and elaborate live shows, they are one of the most influential and commercially successful bands. Key members include Roger Waters, David Gilmour, Nick Mason, and Richard Wright. Albums include "The Dark Side of the Moon" and "The Wall".'
    WHEN 17 THEN N'U2 is an Irish rock band from Dublin formed in 1976. Consisting of Bono, The Edge, Adam Clayton, and Larry Mullen Jr., they are known for their anthemic sound and socially conscious lyrics. Major hits include "With or Without You", "I Still Haven''t Found What I''m Looking For", "One", and "Beautiful Day".'
    WHEN 18 THEN N'John Miles (1949-2021) was an English rock musician, vocalist, and composer. Best known for his 1976 hit "Music", which became an anthem with its powerful chorus "Music was my first love". He later became a session musician and performed with many artists including Tina Turner and The Who.'
    WHEN 19 THEN N'Dire Straits were a British rock band formed in London in 1977. Led by singer-songwriter and guitarist Mark Knopfler, they are known for their stripped-down sound and Knopfler''s distinctive fingerpicking guitar style. Massive hits include "Sultans of Swing", "Money for Nothing", "Brothers in Arms", and "Walk of Life".'
    WHEN 20 THEN N'Eric Clapton is an English rock and blues guitarist, singer, and songwriter. Regarded as one of the greatest guitarists of all time, he has been inducted into the Rock and Roll Hall of Fame three times. Known for "Layla", "Tears in Heaven", "Wonderful Tonight", and his covers of "I Shot the Sheriff" and "Cocaine".'
    
    -- More Artists
    WHEN 21 THEN N'Golden Earring is a Dutch rock band founded in 1961 in The Hague. One of the world''s longest-running bands, they achieved international success with "Radar Love" (1973) and "Twilight Zone" (1982). The band is a cornerstone of Dutch rock music.'
    WHEN 22 THEN N'The Alan Parsons Project was a British rock band active from 1975 to 1990. Created by Alan Parsons and Eric Woolfson, they produced progressive rock with sophisticated production. Known for concept albums and hits like "Eye in the Sky", "Games People Play", and "Don''t Answer Me".'
    WHEN 23 THEN N'R.E.M. was an American rock band from Athens, Georgia, formed in 1980. Pioneers of alternative rock, they influenced the grunge and indie rock movements. Members included Michael Stipe, Peter Buck, Mike Mills, and Bill Berry. Hits include "Losing My Religion", "Everybody Hurts", and "Man on the Moon".'
    WHEN 24 THEN N'Supertramp is a British rock band formed in London in 1969. Known for their progressive rock sound with strong keyboards and saxophone, they achieved worldwide success in the 1970s. Key albums include "Crime of the Century" and "Breakfast in America". Hits include "Dreamer", "The Logical Song", and "Take the Long Way Home".'
    WHEN 25 THEN N'Het Klein Orkest is a Dutch band formed in 1978. Known for their theatrical performances and poetic Dutch lyrics, they blend cabaret with rock. The band gained fame with songs about everyday life and social themes.'
    WHEN 26 THEN N'Toto is an American rock band formed in 1977. Known for their technical proficiency and diverse musical influences, they have sold over 40 million records. The band includes some of the most sought-after session musicians. Mega-hits include "Africa", "Hold the Line", and "Rosanna".'
    WHEN 27 THEN N'Wim Sonneveld (1917-1974) was a Dutch cabaret artist and singer, considered one of the greatest Dutch entertainers. Known for his sophisticated humor and musical talents, he performed songs, monologues, and sketches. His work remains influential in Dutch cabaret.'
    WHEN 28 THEN N'Elton John is an English singer, songwriter, and pianist. One of the best-selling music artists of all time with over 300 million records sold worldwide. Known for his flamboyant stage presence and collaborations with lyricist Bernie Taupin. Classics include "Rocket Man", "Your Song", "Tiny Dancer", and "Candle in the Wind".'
    WHEN 29 THEN N'Marillion is a British rock band formed in Aylesbury in 1979. Pioneers of neo-progressive rock, they achieved early success with vocalist Fish, then continued with Steve Hogarth. Known for their conceptual approach and lengthy compositions. Albums include "Misplaced Childhood" and "Clutching at Straws".'
    WHEN 30 THEN N'Bob Marley & The Wailers were a Jamaican reggae band led by Bob Marley (1945-1981). They popularized reggae music worldwide and spread messages of peace, love, and social justice. Marley remains a global icon. Classic songs include "No Woman, No Cry", "Redemption Song", "One Love", and "Three Little Birds".'
    
    -- International Artists
    WHEN 31 THEN N'Boudewijn de Groot is a Dutch singer-songwriter, one of the most influential artists in Dutch music. Since the 1960s, he has combined poetic lyrics with folk and rock influences. His songs address social issues and personal themes, making him a cultural icon in the Netherlands.'
    WHEN 32 THEN N'Celine Dion is a Canadian singer born in 1968. One of the best-selling artists of all time, known for her powerful vocals and emotional ballads. She gained international fame with "My Heart Will Go On" from Titanic. Other hits include "The Power of Love", "Because You Loved Me", and "All by Myself".'
    WHEN 33 THEN N'10cc is an English rock band formed in Stockport in 1972. The band initially consisted of four musicians - Graham Gouldman, Eric Stewart, Kevin Godley, and Lol Creme - who had written and recorded together since 1968. The group is known for their pop rock hits and sophisticated studio production. Their biggest hits include "I''m Not in Love" (1975), "Dreadlock Holiday" (1978), and "The Things We Do for Love" (1976). The band''s name has various origin stories, with the members often providing humorous explanations. 10cc achieved international success in the 1970s and early 1980s with their distinctive blend of art rock, pop, and humor.'
    WHEN 34 THEN N'Acda en de Munnik is a Dutch cabaret/kleinkunst duo formed in 1995 by Thomas Acda and Paul de Munnik. Known for their witty, poetic lyrics and melodic folk-pop songs, they became one of the most successful Dutch acts. They explore themes of love, friendship, and everyday life with humor and depth.'
    WHEN 35 THEN N'Bryan Adams is a Canadian rock singer-songwriter and guitarist. Since the 1980s, he has achieved worldwide fame with his raspy vocals and heartfelt rock ballads. Major hits include "Summer of ''69", "(Everything I Do) I Do It for You", "Heaven", and "Run to You".'
    WHEN 36 THEN N'Art Garfunkel is an American singer, poet, and actor, best known as half of the folk rock duo Simon & Garfunkel. His distinctive tenor voice was central to the duo''s sound. Solo hits include "Bright Eyes" and "All I Know". He has also appeared in films like "Catch-22" and "Carnal Knowledge".'
    WHEN 37 THEN N'Bette Midler is an American singer, actress, and comedian. Known as "The Divine Miss M", she has had success across multiple entertainment fields. Her powerful voice and theatrical performances have made her an icon. Hits include "Wind Beneath My Wings", "From a Distance", and "The Rose".'
    WHEN 38 THEN N'Bruce Springsteen is an American rock singer-songwriter nicknamed "The Boss". Since the 1970s, he has been known for his poetic lyrics about working-class American life and his energetic stage performances. Classic albums include "Born to Run" and "Born in the U.S.A.". Hits include "Thunder Road", "Dancing in the Dark", and "Streets of Philadelphia".'
    WHEN 39 THEN N'The Beach Boys are an American rock band formed in California in 1961. Known for their vocal harmonies and themes of youth culture, they helped define the California sound. Led by Brian Wilson, their innovations in the studio were groundbreaking. Classics include "Good Vibrations", "Surfin'' U.S.A.", "God Only Knows", and "California Girls".'
    WHEN 40 THEN N'AC/DC is an Australian rock band formed in Sydney in 1973 by brothers Malcolm and Angus Young. Known for their high-energy performances and hard rock sound, they are one of the best-selling bands ever. Vocalist Bon Scott died in 1980 and was replaced by Brian Johnson. Anthems include "Highway to Hell", "Back in Black", "Thunderstruck", and "You Shook Me All Night Long".'
    
    -- More Rock and Pop Icons
    WHEN 41 THEN N'Prince (1958-2016) was an American singer-songwriter and multi-instrumentalist. A musical genius known for his eclectic style, flamboyant stage presence, and wide vocal range. He blended funk, rock, R&B, and pop. Iconic works include "Purple Rain", "When Doves Cry", "Kiss", "Little Red Corvette", and "1999".'
    WHEN 42 THEN N'Creedence Clearwater Revival (CCR) was an American rock band active 1968-1972. Led by John Fogerty, they created swamp rock with a distinctive sound despite being from California. Known for their string of hit singles including "Proud Mary", "Bad Moon Rising", "Fortunate Son", and "Have You Ever Seen the Rain".'
    WHEN 43 THEN N'David Bowie (1947-2016) was an English singer-songwriter and actor. A leading figure in popular music, he was known for his innovative music and visual presentation. He reinvented himself multiple times with personas like Ziggy Stardust. Classics include "Space Oddity", "Heroes", "Let''s Dance", "Starman", and "Life on Mars".'
    WHEN 44 THEN N'Cockney Rebel, later Steve Harley & Cockney Rebel, is a British rock band formed in 1973. Led by Steve Harley, they are known for their glam rock style and theatrical performances. Their biggest hit is "Make Me Smile (Come Up and See Me)" (1975).'
    WHEN 45 THEN N'Alice Cooper is an American rock singer whose career spans over 50 years. Known as "The Godfather of Shock Rock", he pioneered a theatrical and horror-inspired stage show that influenced heavy metal and rock. Born Vincent Furnier, hits include "School''s Out", "Poison", "No More Mr. Nice Guy", and "I''m Eighteen".'
    WHEN 46 THEN N'Fleetwood Mac is a British-American rock band formed in London in 1967. The band has undergone many lineup changes, with the Stevie Nicks/Lindsey Buckingham era being the most commercially successful. Their album "Rumours" is one of the best-selling albums ever. Hits include "Dreams", "Go Your Own Way", "The Chain", and "Don''t Stop".'
    WHEN 47 THEN N'Van Dik Hout is a Dutch rock band formed in 1994. Named after a neighborhood in Amsterdam, they are known for their energetic rock sound and Dutch lyrics. They have been a significant presence in Dutch rock music with multiple hit albums.'
    WHEN 48 THEN N'Jacques Brel (1929-1978) was a Belgian singer-songwriter and actor. Considered a master of the modern chanson, his dramatic and emotionally powerful songs have been translated and covered by many artists worldwide. Known for "Ne Me Quitte Pas", "Amsterdam", and "La Valse à Mille Temps".'
    WHEN 49 THEN N'Kate Bush is an English singer-songwriter known for her distinctive voice and experimental music. Her debut single "Wuthering Heights" (1978) made her the first female artist to achieve a UK number-one with a self-written song. Other classics include "Running Up That Hill", "Babooshka", and "Cloudbusting".'
    WHEN 50 THEN N'Black Sabbath were an English rock band formed in Birmingham in 1968. Pioneers of heavy metal, the original lineup included Ozzy Osbourne, Tony Iommi, Geezer Butler, and Bill Ward. Known for their dark sound and themes, classics include "Paranoid", "Iron Man", "War Pigs", and "N.I.B.".'
    
    -- 70s-80s Icons
    WHEN 51 THEN N'Electric Light Orchestra (ELO) is a British rock band formed in Birmingham in 1970. Led by Jeff Lynne, they blended rock and pop with classical arrangements featuring strings and keyboards. Known for their futuristic sound and elaborate concerts. Hits include "Mr. Blue Sky", "Don''t Bring Me Down", "Evil Woman", and "Livin'' Thing".'
    WHEN 52 THEN N'Al Stewart is a Scottish singer-songwriter known for his folk-rock music with historical themes. His breakthrough album "Year of the Cat" (1976) featured the hit title track. Other notable songs include "Time Passages" and "On the Border".'
    WHEN 53 THEN N'Phil Collins is an English drummer, singer-songwriter, and producer. Initially drummer for Genesis, he became a successful solo artist in the 1980s. Known for his distinctive voice and drum sound. Hits include "In the Air Tonight", "Against All Odds", "Another Day in Paradise", and "You Can''t Hurry Love".'
    WHEN 54 THEN N'André Hazes (1951-2004) was a Dutch singer and actor, considered one of the most successful artists in Dutch music. Known for his "levenslied" (songs about life) style, he sang about love, sorrow, and joy. His emotional performances made him a beloved figure in the Netherlands.'
    WHEN 55 THEN N'Wham! was an English pop duo formed in 1981 by George Michael and Andrew Ridgeley. They became one of the most successful pop acts of the 1980s with their upbeat dance-pop sound. Mega-hits include "Wake Me Up Before You Go-Go", "Careless Whisper", "Last Christmas", and "Everything She Wants".'
    WHEN 56 THEN N'The Jimi Hendrix Experience was a British-American rock band formed in 1966. Led by Jimi Hendrix, widely regarded as the greatest electric guitarist in rock history, the group revolutionized rock music. Classic tracks include "Purple Haze", "Hey Joe", "All Along the Watchtower", and "Voodoo Child".'
    WHEN 57 THEN N'Ramses Shaffy (1933-2009) and Liesbeth List (1941-2020) were Dutch singers and actors who frequently collaborated. Shaffy was a charismatic performer known for his theatrical style, while List had a powerful, emotive voice. Together they created memorable Dutch music blending cabaret and chanson.'
    WHEN 58 THEN N'Michael Jackson (1958-2009) was an American singer, songwriter, and dancer. Dubbed the "King of Pop", he is one of the most significant cultural figures of the 20th century. His contributions to music, dance, and fashion made him a global icon. Hits include "Thriller", "Billie Jean", "Beat It", "Bad", and "Smooth Criminal".'
    WHEN 59 THEN N'Joe Cocker (1944-2014) was an English singer known for his gritty, powerful voice and unique stage performances. His distinctive interpretations of songs by others became classics. Known for "With a Little Help from My Friends", "You Are So Beautiful", "Up Where We Belong", and "Unchain My Heart".'
    WHEN 60 THEN N'Bonnie Tyler is a Welsh singer known for her distinctive husky voice. She achieved international success in the 1970s and 1980s with powerful rock ballads. Major hits include "Total Eclipse of the Heart", "Holding Out for a Hero", "It''s a Heartache", and "Faster Than the Speed of Night".'
    
    -- More 80s-90s Artists
    WHEN 61 THEN N'The Police were an English rock band formed in London in 1977. Consisting of Sting, Andy Summers, and Stewart Copeland, they blended rock with reggae and punk influences. One of the biggest bands of the early 1980s, hits include "Every Breath You Take", "Roxanne", "Message in a Bottle", and "Don''t Stand So Close to Me".'
    WHEN 62 THEN N'George Michael (1963-2016) was an English singer-songwriter who rose to fame as a member of Wham! before embarking on a hugely successful solo career. Known for his smooth voice and songwriting talent. Solo hits include "Careless Whisper", "Faith", "Father Figure", and "Freedom! ''90".'
    WHEN 63 THEN N'Sinéad O''Connor (1966-2023) was an Irish singer-songwriter known for her powerful voice and rebellious spirit. She achieved worldwide fame with "Nothing Compares 2 U" (1990). Her music combined rock, pop, and traditional Irish influences. Known for her outspoken activism and striking appearance.'
    WHEN 64 THEN N'Barbra Streisand is an American singer, actress, and filmmaker. One of the best-selling recording artists of all time, she has achieved success in multiple entertainment fields. Known for her powerful voice and dramatic interpretations. Hits include "The Way We Were", "Evergreen", "Woman in Love", and "People".'
    WHEN 65 THEN N'Genesis is an English rock band formed in 1967. Initially a progressive rock band with Peter Gabriel, they evolved into pop-rock with Phil Collins as lead singer. One of the best-selling bands ever, their music spans from complex progressive pieces to accessible pop hits. Notable songs include "Invisible Touch", "Land of Confusion", and "I Can''t Dance".'
    WHEN 66 THEN N'Bob Dylan is an American singer-songwriter, widely regarded as one of the greatest songwriters of all time. His work since the 1960s has been influential across popular music and culture. He received the Nobel Prize in Literature in 2016. Classics include "Blowin'' in the Wind", "The Times They Are a-Changin''", "Like a Rolling Stone", and "Knockin'' on Heaven''s Door".'
    WHEN 67 THEN N'Kansas is an American rock band formed in 1973. Known for their progressive rock sound incorporating classical and symphonic elements, they achieved commercial success in the 1970s and 1980s. Best known for "Carry On Wayward Son" and "Dust in the Wind".'
    WHEN 68 THEN N'The Bangles are an American pop rock band formed in Los Angeles in 1981. Known for their jangly guitar sound and vocal harmonies, they achieved major success in the 1980s. Hits include "Walk Like an Egyptian", "Eternal Flame", "Manic Monday", and "Hazy Shade of Winter".'
    WHEN 69 THEN N'Barry Ryan is a British singer born in 1948. He had success in the late 1960s and early 1970s, particularly in Europe. Best known for the dramatic song "Eloise" (1968), which topped charts across Europe.'
    WHEN 70 THEN N'Falco (1957-1998) was an Austrian singer and rapper. He achieved international fame with "Rock Me Amadeus" (1985), which topped charts worldwide. He was one of the first artists to bring German-language rap to mainstream audiences. Other hits include "Der Kommissar" and "Vienna Calling".'
    
    -- Classic Rock and Others
    WHEN 71 THEN N'Chicago is an American rock band formed in 1967. Known for their horn section and blend of rock with jazz influences, they are one of the longest-running and best-selling groups. Hits include "25 or 6 to 4", "Saturday in the Park", "If You Leave Me Now", and "Hard to Say I''m Sorry".'
    WHEN 72 THEN N'Doe Maar was a Dutch pop band formed in 1978. They became one of the most successful bands in Dutch history, blending reggae, ska, and pop with Dutch lyrics. Their songs addressed social issues and teenage life. Major hits include "Is Dit Alles", "32 Jaar", and "De Bom".'
    WHEN 73 THEN N'Édith Piaf (1915-1963) was a French singer known as "The Little Sparrow". One of France''s greatest international stars, her voice conveyed deep emotion. She is celebrated for chanson classics like "La Vie en Rose", "Non, je ne regrette rien", and "Hymne à l''amour".'
    WHEN 74 THEN N'Bee Gees were a British-Australian pop group formed in 1958. Brothers Barry, Robin, and Maurice Gibb created some of the most memorable music of the 20th century. They achieved massive success with disco music in the late 1970s. Hits include "Stayin'' Alive", "How Deep Is Your Love", "Night Fever", and "To Love Somebody".'
    WHEN 75 THEN N'Andrea Bocelli is an Italian tenor and singer. Born in 1958, he has sold over 90 million records worldwide. Known for bringing classical and operatic music to a wider audience, he crosses over between classical and pop. Famous songs include "Con te partirò (Time to Say Goodbye)", "The Prayer", and "Vivo per lei".'
    WHEN 76 THEN N'Lionel Richie is an American singer-songwriter and producer. Initially with The Commodores, he launched a hugely successful solo career in the 1980s. Known for his smooth ballads and romantic songs. Hits include "Hello", "All Night Long", "Easy", "Three Times a Lady", and "Endless Love".'
    WHEN 77 THEN N'Elvis Presley (1935-1977) was an American singer and actor, known as the "King of Rock and Roll". One of the most significant cultural icons of the 20th century, he revolutionized popular music. His energetic performances and unique blend of musical styles made him a sensation. Classics include "Hound Dog", "Jailhouse Rock", "Can''t Help Falling in Love", and "Suspicious Minds".'
    WHEN 78 THEN N'Frank Sinatra (1915-1998) was an American singer and actor, one of the most popular entertainers of the 20th century. Known as "Ol'' Blue Eyes" and "The Chairman of the Board", his smooth voice and phrasing influenced generations. Classics include "My Way", "Fly Me to the Moon", "New York, New York", and "Strangers in the Night".'
    WHEN 79 THEN N'Stef Bos is a Dutch-Belgian singer and songwriter born in 1961. Known for his poetic lyrics and storytelling songs, he achieved fame in the Netherlands and Belgium. His music often explores themes of love, loss, and African experiences. Notable songs include "Papa" and "Is Dit Nu Later".'
    WHEN 80 THEN N'Marco Borsato is a Dutch-Italian singer born in 1966. One of the most successful Dutch artists, he initially sang in Italian before switching to Dutch. His romantic pop songs and emotional performances have made him a household name. Hits include "Dromen Zijn Bedrog", "Zij", and "Rood".'
    
    -- More Artists
    WHEN 81 THEN N'De Kast is a Dutch band formed in 1990 in Friesland. They sing in the Frisian language and are known for their energetic folk-rock style. They have played a significant role in popularizing Frisian music beyond the region.'
    WHEN 82 THEN N'Kiss is an American rock band formed in New York in 1973. Known for their face paint, elaborate stage costumes, and theatrical performances, they pioneered shock rock. The original lineup included Paul Stanley, Gene Simmons, Ace Frehley, and Peter Criss. Hits include "Rock and Roll All Nite", "Detroit Rock City", and "I Was Made for Lovin'' You".'
    WHEN 83 THEN N'Neil Young is a Canadian-American singer-songwriter and musician. Active since the 1960s, he has been influential in rock and folk music. Known for his distinctive tenor voice and guitar work, his music ranges from acoustic folk to heavy electric rock. Classics include "Heart of Gold", "Rockin'' in the Free World", "Old Man", and "Harvest Moon".'
    WHEN 84 THEN N'Normaal is a Dutch rock band from the Achterhoek region, formed in 1975. Pioneers of singing in the Achterhooks dialect, they brought regional identity to Dutch rock music. Known for their straightforward rock sound and songs about rural life and local pride.'
    WHEN 85 THEN N'Santana is an American rock band formed in San Francisco in 1966 by Mexican-American guitarist Carlos Santana. Known for their fusion of rock, Latin American music, and jazz, they achieved fame at Woodstock. Classics include "Black Magic Woman", "Oye Como Va", "Smooth", and "Europa".'
    WHEN 86 THEN N'Crosby, Stills, Nash & Young (CSNY) is a British-American folk rock supergroup formed in 1968. Consisting of David Crosby, Stephen Stills, Graham Nash, and Neil Young, they are known for their vocal harmonies and socially conscious lyrics. Hits include "Suite: Judy Blue Eyes", "Teach Your Children", and "Ohio".'
    WHEN 87 THEN N'Europe is a Swedish rock band formed in 1979. They achieved international fame with their power ballad "The Final Countdown" (1986), which topped charts worldwide. Led by vocalist Joey Tempest, they represent the melodic hard rock of the 1980s.'
    WHEN 88 THEN N'The Kinks were an English rock band formed in London in 1963. One of the most influential bands of the British Invasion, led by brothers Ray and Dave Davies. Known for their satirical social commentary and pioneering hard rock sound. Classics include "You Really Got Me", "Waterloo Sunset", "Lola", and "Sunny Afternoon".'
    WHEN 89 THEN N'Whitney Houston (1963-2012) was an American singer and actress. One of the best-selling music artists of all time, she was known for her powerful voice and crossover success. Her vocal ability influenced a generation of singers. Hits include "I Will Always Love You", "Greatest Love of All", "I Wanna Dance with Somebody", and "How Will I Know".'
    WHEN 90 THEN N'A-ha is a Norwegian synth-pop band formed in Oslo in 1982. They achieved global fame with "Take On Me" (1985), known for its innovative animated music video. The band consists of Morten Harket, Paul Waaktaar-Savoy, and Magne Furuholmen. Other hits include "The Sun Always Shines on T.V." and "Hunting High and Low".'
    
    -- Collaborations and Special Projects
    WHEN 91 THEN N'David Bowie & Queen collaboration produced "Under Pressure" (1981), one of the most iconic rock songs ever. The spontaneous jam session between these legendary artists resulted in a powerful song about the pressures of modern life, featuring both Bowie''s and Freddie Mercury''s distinctive vocals.'
    WHEN 92 THEN N'Cliff Richard & The Young Ones collaboration was a 1986 charity remake of "Living Doll". British singer Cliff Richard joined forces with the comedy team from the TV show "The Young Ones" to create a humorous version that topped the UK charts.'
    WHEN 93 THEN N'Yes is an English progressive rock band formed in London in 1968. Known for their complex compositions, virtuoso musicianship, and elaborate album artwork, they are pioneers of prog rock. Key members included Jon Anderson, Steve Howe, Rick Wakeman, Chris Squire, and Bill Bruford. Classics include "Roundabout", "Owner of a Lonely Heart", and "I''ve Seen All Good People".'
    WHEN 94 THEN N'Sting is an English musician, singer, songwriter, and actor. Born Gordon Sumner, he was the principal songwriter and bassist for The Police before launching a successful solo career. Known for his distinctive voice and jazz-influenced pop. Solo hits include "Fields of Gold", "Englishman in New York", "Desert Rose", and "Shape of My Heart".'
    WHEN 95 THEN N'Henk Westbroek is a Dutch singer, songwriter, and radio DJ born in 1952. He has been part of several bands including Neerlands Hoop and Het Goede Doel. Known for his rock music with Dutch lyrics and his outspoken personality.'
    WHEN 96 THEN N'Seal is a British singer and songwriter born Henry Olusegun Adeola Samuel in 1963. Known for his distinctive voice and soul-influenced pop. He achieved massive success in the 1990s with hits like "Kiss from a Rose", "Crazy", and "Prayer for the Dying".'
    WHEN 97 THEN N'Freddie Mercury & Montserrat Caballé collaboration produced the album "Barcelona" (1988). The Queen frontman teamed with Spanish operatic soprano Montserrat Caballé to create a unique blend of rock and opera. The title track "Barcelona" became an anthem for the 1992 Barcelona Olympics.'
    WHEN 98 THEN N'Ike & Tina Turner were an American musical duo formed in 1960. Led by Ike Turner and featuring Tina Turner''s powerful vocals, they were a dynamic soul and R&B act. Despite their professional success with hits like "Proud Mary" and "River Deep – Mountain High", their relationship was marked by abuse, which Tina later escaped to launch a solo career.'
    WHEN 99 THEN N'Band Aid was a charity supergroup formed in 1984 by Bob Geldof and Midge Ure. They recorded "Do They Know It''s Christmas?" to raise money for famine relief in Ethiopia. The single featured numerous British and Irish pop stars and became one of the best-selling singles ever, inspiring similar charity efforts worldwide.'
    WHEN 100 THEN N'Peter Maffay is a German musician and singer born in Romania in 1949. One of the most successful German recording artists, he has released numerous albums spanning rock, pop, and concept albums. Known for his Tabaluga rock fairy tale series and hits like "Du" and "Über sieben Brücken musst du gehn".'
    
    ELSE [Biography] -- Keep existing biography if already populated
END
WHERE [ArtistId] BETWEEN 1 AND 100;
GO

-- ============================================
-- PART 2: Verify the updates
-- ============================================

SELECT 
    [ArtistId],
    [Name],
    CASE 
        WHEN [Biography] IS NOT NULL THEN 'Updated'
        ELSE 'Still NULL'
    END AS [Biography_Status]
FROM [dbo].[Artist]
WHERE [ArtistId] BETWEEN 1 AND 100
ORDER BY [ArtistId];
GO

-- ============================================
-- PART 3: Template for remaining artists
-- ============================================
-- For the remaining 8,236 artists, you can:
-- 1. Use the same CASE pattern with more WHEN clauses
-- 2. Use an external data source (API, CSV) to populate biographies
-- 3. Create multiple UPDATE statements grouped by genre or era
-- 4. Generate biographies programmatically using artist name and research

-- Example: Bulk update with placeholder for remaining artists
-- Uncomment and modify as needed:
/*
UPDATE [dbo].[Artist]
SET [Biography] = N'Artist biography for ' + [Name] + N'. This is a placeholder. Please update with actual biographical information from reliable sources.'
WHERE [Biography] IS NULL;
GO
*/

-- ============================================
-- PART 4: Statistics
-- ============================================

SELECT 
    COUNT(*) AS [Total_Artists],
    SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) AS [With_Biography],
    SUM(CASE WHEN [Biography] IS NULL THEN 1 ELSE 0 END) AS [Without_Biography],
    CAST(SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS [Percentage_Complete]
FROM [dbo].[Artist];
GO
