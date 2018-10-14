# <img alt="NodeBB" src="https://github.com/jorwalk/OCI-GlobalHack-VII/blob/master/3.png" />
## Inspiration

A wide variety of resources are available to the immigrant and refugee communities, but the process for discovering and leveraging those resources has proven to be disjointed and slow. Four of the eight members on our GlobalHack team immigrated to the United States and experienced this challenge first-hand.

In our team brainstorming sessions, one theme that continually emerged was how time-consuming it can be to track down information. Frequently, once this information is tracked down, it must be acted upon with expediency. For example, there is a significant paperwork burden associated with the process of obtaining housing, applying for a job, and purchasing insurance. Each of these processes are dependent upon overlapping informational inputs. 

We agreed there must be a way to accelerate these processes, and we were inspired to build a solution that addresses this challenge by:

- Matching individuals to available resources  
- Connecting immigrant and refugee citizens to one another  
- Creating a logical, sequential set of steps toward acclimation   

We recognize that the stress and sense of upheaval upon landing in a foreign country can be daunting. Thus, our first priority in building this solution was to address basic living needs and to create a sense of safety. Secondarily, we chose to include elements of joy and fun into the user experience -- to help bridge the gaps between arriving, surviving, and eventually, thriving. 

## What it does

WelcomeU is a web application that will connect foreign-born individuals to local resources through:

- Personalization  
- Artificial intelligence  
- Community interaction  

### Personalization 

WelcomeU offers an intuitive and responsive onboarding flow that asks users a series of optional questions, which can be answered anonymously. Examples of onboarding questions include one’s age, gender, country of origin, and family composition. 

Based on the user’s responses to these questions, WelcomeU serves up a set of recommended resources. Examples of recommended resources may include local healthcare clinics, job training programs, and invitations to join online groups of individuals who share similar life experiences. 

In its current state, WelcomeU returns its recommended resources from a pre-configured set of data. In a future state, WelcomeU will become further personalized by returning recommended resources that are scraped from the web based on the user’s location. 

### Artificial Intelligence

As users interact with WelcomeU, they will be prompted to provide feedback on the usefulness of the recommended resources that WelcomeU provides. In a future state, WelcomeU will leverage artificial intelligence to provide increasingly useful recommendations based on this valuable user feedback.

To provide a stronger sense of personalization, we chose to incorporate a chatbot into WelcomeU. The chatbot is an important element of WelcomeU because it helps our users to feel understood and it simplifies their experience with acclimating to the United States. 

One example of how our chatbot will personalize the experience the experience of WelcomeU is by responding to questions and providing recommendations that our users may not have considered if they had searched unassisted by the chatbot: 

![alt text](https://objectcomputing.com/index.php/download_file/2676)

In a future state, our chatbot will communicate in multiple languages based on the language preference set by the user. 
  
### Community Interaction 

Inclusion in social settings is the foundation of every community. WelcomeU accounts for this by connecting foreign-born individuals to communities of individuals who share a similar life experience. 

In addition to permitting users to post and respond in a public forum setting, WelcomeU supports one-on-one messaging as well as group messaging. Post count and user roles establish reputation and can elevate trust in a user’s content. The discussion topics on WelcomeU are categorized by topic. Examples of topics include job postings, housing availability, events, and child care. 

## How we built it

In our team brainstorming sessions, we described capabilities that we considered important including communication, aggregation, and sharing. To our surprise, the further we went down the path of investigating how we would deliver those capabilities, a solution emerged: a bulletin board. 

That’s right, y’all. It’s an interactive knowledge base.

We picked NodeBB for our bulletin board platform. NodeBB is written in JavaScript, and we deployed to Heroku. NodeBB uses MongoDB. NodeBB contains built-in localization for over 40 languages.

We used Bootstrap with Bootswatch to design and theme the front-end for our landing page and static pages. 

We wanted a Chatbot that could answer informational queries with curated responses, and Patrick talked up Google’s Dialogflow despite having relatively little experience with it, so Huang-Ming and Suman jumped on that to create our voice assistant solution. We seeded the knowledge base with some vital information that our chatbot can reference. As the knowledge base grows organically through engagement, the chatbot can be updated to reflect the most up-to-date information.

## Challenges we ran into

The initial challenge we ran into was brainstorming a solution that addresses the diverse hardships facing foreign-born individuals in the United States. Foreign-born individuals may enter the United States under a variety of conditions, including human trafficking, refuge from war, purposeful immigration, among others. The second challenge we ran into was finding a solution that could support this diverse group of individuals in their native languages. 

## Accomplishments that we’re proud of

Our solution utilizes a number of open-source and free services. 

## What we learned

We learned that foreign-born individuals in the United States must overcome significant challenges to acclimate to their new homes. We also learned that technology could be the answer that brings everyone closer together. 

## What’s next for the project?

The next steps for this project include building out additional language functionality in the chatbot and ongoing engagement with the knowledge base to identify trustworthy contributors and solicit community involvement in moderation teams. We want to reach out to immigrant-owned businesses and companies seeking to hire immigrants in our community for paid placement opportunities. We also wish to develop “missions” that incorporate exploration and fun.

## License

NodeBB is licensed under the **GNU General Public License v3 (GPL-3)** (http://www.gnu.org/copyleft/gpl.html).

Interested in a sublicense agreement for use of NodeBB in a non-free/restrictive environment? Contact us at sales@nodebb.org.
