-- Generated SQL dump with schema and data
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS job_posting;
CREATE TABLE job_posting (
  id BIGSERIAL PRIMARY KEY,
  jobUrl TEXT NOT NULL UNIQUE,
  positionName VARCHAR(512) NOT NULL,
  organizationUrl TEXT,
  logoUrl TEXT,
  organizationTitle VARCHAR(512),
  laborFunction VARCHAR(256),
  postedDateEpoch BIGINT,
  descriptionHtml TEXT,
  createdAt TIMESTAMP
);
CREATE TABLE location (
  id BIGSERIAL PRIMARY KEY,
  city VARCHAR(255),
  stateRegion VARCHAR(255),
  country VARCHAR(255),
  raw VARCHAR(512),
  job_posting_id BIGINT REFERENCES job_posting(id) ON DELETE CASCADE
);
CREATE TABLE tag (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255),
  job_posting_id BIGINT REFERENCES job_posting(id) ON DELETE CASCADE
);

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/alloy-2-bb488319-20df-4a72-910e-ea14dfc26a3e/jobs/56373782-senior-full-stack-engineer-partner-ecosystem-platform#content', 'Senior Full Stack Engineer, Partner Ecosystem Platform', 'https://jobs.techstars.com/companies/alloy-2-bb488319-20df-4a72-910e-ea14dfc26a3e#content', 'https://cdn.getro.com/companies/7bf08575-fb7c-58c4-9527-43a9cf4aa33c-1747791189', 'Alloy', 'Software Engineering', 1755083718, '<div>
 <h2>Alloy is where you belong!</h2>
 <p><span>Alloy helps solve the identity risk problem for companies that offer financial products by enabling them to outpace fraud and confidently serve more people around the world. Over 600 of the world’s largest financial institutions and fintechs turn to Alloy to take control of fraud, credit, and compliance risk, and grow with the clearest picture of their customers.</span></p>
 <p><span>Through our values: Be Bold, Get Scrappy, Collaborate, and Celebrate Our Differences, we are creating a workplace where you can grow, thrive, and belong. See how we’ve been continuously recognized and named one of <a href="https://www.inc.com/profile/alloy">Inc. Magazine’s Best Workplaces</a>, <a href="https://www.forbes.com/companies/alloy/?list=americas-best-startup-employers&amp;sh=55c076453c61">Forbes America’s Best Startup Employers</a>, <a href="https://www.americanbanker.com/list/best-places-to-work-in-fintech">Best Fintech to Work for by American Banker</a>, year after year.</span></p>
 <p><span>Check out our investors and read more about us <a href="https://www.alloy.com/about">here</a>.</span></p>
 <h2>About the team</h2>
 <p>Alloy is actively hiring experienced full stack engineers to join the Partner Ecosystem Platform Engineering team to design and build a future data provider integration platform. Alloy partners with hundreds of data vendors that perform work across identity verification, fraud mitigation and many others. To scale this out Alloy is building the next generation integration platform, which will make it easy to build, operate and maintain data integrations. Alloy is hiring experienced engineers who can lead this effort, creating a new platform that enables the new stage of Alloy’s growth.</p>
 <p>Alloy operates in a hybrid-work environment. We look to foster collaboration and community by having our local employees onsite twice a week, and remote employees onsite once per quarter.</p>
 <h2><strong>What you''ll be doing</strong></h2>
 <p>Reporting to the Head of Engineering, you will:</p>
 <ul>
  <li>Design and build a scalable platform that simplifies the creation/operation of hundreds of data partner integrations.</li>
  <li>Collaborate with engineers, designers, and product managers to translate our product and technical vision into a concrete roadmap, guiding the team towards success.</li>
  <li>Partner with third-party vendors &amp; our clients to gather requirements and co-create solutions, ensuring seamless integration of their data within the core product and the evolving marketplace experience.</li>
  <li>Architect, develop, test, and deploy significant customer-facing features and projects using cutting-edge tools and technologies. Our tech stack includes TypeScript, JavaScript (ES6/React), Python (Django), Node.js, PostgreSQL, Elasticsearch, and AWS.</li>
  <li>Craft high-quality, thoroughly-tested code that meets the unique requirements of our clients, ensuring robustness and reliability.</li>
  <li>Provide technical mentorship and guidance to fellow engineers, fostering a culture of learning and growth within our rapidly expanding team.</li>
 </ul>
 <p>In summary, you will play a pivotal role in building out the next generation of partner ecosystem platform at Alloy, driving the development of integrations with our data partner APIs and SDKs, leveraging your technical expertise to build solutions that have a significant market impact while fostering a collaborative and high-performance team environment.</p>
 <h2><strong>Who we''re looking for</strong></h2>
 <ul>
  <li>10+ years of hands-on experience in developing production-ready software, demonstrating a proven track record of delivering robust and scalable solutions.</li>
  <li>Experience maintaining and working with data integrations / external API sources</li>
  <li>Exhibits expertise in steering both front-end and backend technical projects, adept at prioritizing tasks, defining requirements, and facilitating productive discussions within the team to drive informed technical decisions.</li>
  <li>Brings to the table a collaborative mindset, having effectively led engineering teams in collective pursuits, fostering an environment of cooperation and shared success.</li>
  <li>Demonstrates a remarkable ability to adapt swiftly to the evolving needs of our growing organization and dynamic product landscape, ensuring alignment with strategic objectives.</li>
  <li>Proficient in client-side technologies such as TypeScript, JavaScript (ES6/React), HTML/CSS, as well as server-side proficiency in Python (Django), enabling seamless development across the entire stack.</li>
  <li>Holds practical experience in managing relational databases, with a strong command over PostgreSQL and its intricacies, ensuring efficient data management and retrieval.</li>
 </ul>
 <p><strong>Nice to have:</strong></p>
 <ul>
  <li>Experience working in developer productivity domain and/or SDKs</li>
  <li>Experience working in Fintech or the financial services industry.</li>
 </ul>
 <p>We''re a lean team, so your impact will be felt immediately, and opportunities will grow as the company scales up. If this all sounds like a good fit for you, why not join us?</p>
 <p>Alloy is committed to fair and equitable compensation practices. Below is the anticipated starting base compensation range for this role; however, pay may vary depending on job-related knowledge, in-demand skills, relevant experience, and/or geography. In addition to a competitive base salary, this position is also eligible for equity awards in the form of stock options (ISOs) as well as a competitive total benefits package. Your recruiter will be happy to walk you through the details and what compensation could look like for you specifically!</p>
 <p><em>This position has a salary range of $192,000 to $226,000. </em></p>
 <h2>Benefits and Perks</h2>
 <ul>
  <li>Unlimited PTO and flexible work policy</li>
  <li>Employee stock options</li>
  <li>Medical, dental, vision plans with HSA (monthly employer contribution) and FSA options</li>
  <li>401k with 100% match up to 4% of annual employee compensation</li>
  <li>Eligible new parents receive 16 weeks of paid parental leave</li>
  <li>Home office stipend for new employees</li>
  <li>Annual Learning &amp; Development annual stipend</li>
  <li>Well-being benefits include access to ClassPass, OneMedical, and Spring Health</li>
  <li>Hybrid work environment: employees are expected to work Tuesdays and Thursdays from our HQ in Union Square, Manhattan. Tasty lunches catered from a variety of local restaurants and frequent employee-organized cultural events contribute to our positive office energy. On Monday/Wednesday/Friday most employees Zoom into work from home while some take advantage of the quieter office.</li>
 </ul>
 <h2>How to apply</h2>
 <p>Apply right here! You''ve found the application!</p>
 <p>Alloy is proud to be an equal-opportunity workplace and employer. We’re committed to equal opportunity regardless of race, color, ancestry, religion, gender, gender identity, parental or pregnancy status, national origin, sexual orientation, age, citizenship, marital status, disability, or veteran status. We are committed to an inclusive interview experience and provide reasonable accommodations to applicants with visible and invisible disabilities. We encourage applicants to share needed accommodations with their recruiter.</p>
 <p>All Alloy jobs are listed on our careers page. Any communication during the recruitment process, including interview requests or job offers, will come directly from a recruiting team member with an <a href="http://alloy.com/">alloy.com</a> email address. We do not use outside applications or automated text messaging in our recruiting process. We will not ask for any sensitive financial or identification information during the recruiting process. If you’re ever unsure, please contact us directly via our website before sharing personal information.</p>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;

INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'United States', 'United States', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('New York, NY, USA', NULL, NULL, 'New York, NY, USA', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('192k-226k / year', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('USD 192k-226k / year', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('On-site', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Hybrid', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/adsgency-ai-2/jobs/56389425-member-of-technical-staff-full-stack#content', 'Member of Technical Staff, Full Stack', 'https://jobs.techstars.com/companies/adsgency-ai-2#content', 'https://cdn.getro.com/companies/e3cd0834-6cb4-5e7d-9d80-10ca35df486b-1748741801', 'AdsGency AI', 'Software Engineering', 1755087074, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Member of Technical Staff, Full Stack</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/e3cd0834-6cb4-5e7d-9d80-10ca35df486b-1748741801" alt="AdsGency AI">
              </div>
             </div>
             <p>AdsGency AI</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, IT
             </div>
             <div>
              San Francisco, CA, USA · United States · California, USA · San Francisco, CA, USA · United States
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://www.linkedin.com/jobs/view/member-of-technical-staff-full-stack-at-adsgency-ai-4281845864?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            Relocation to San Francisco City is required. 
            <br>
            <br>
             Sponsor OPT/CPT/Stem-OPT and second year H1B. 
            <br>
            <br><strong>Job Description<br><br></strong>👩‍💻 About the Job 
            <br>
            <br>
             Company: AdsGency AI 
            <br>
            <br>
             📍 Location: Onsite (San Francisco City) 
            <br>
            <br>
             💼 Employment Type: Full-Time 
            <br>
            <br>
             🚀 About AdsGency AI 
            <br>
            <br>
             We’re AdsGency AI — an AI-native startup building a multi-agent automation layer for digital advertising. 
            <br>
            <br>
             Our system uses LLM agents to autonomously launch, scale, and optimize ad campaigns across Google, Meta, TikTok, and more — no human marketer required. 
            <br>
            <br>
             Our mission: build infrastructure where AI runs performance marketing better than humans ever could. 
            <br>
            <br>
             We’re backed by top-tier investors and moving fast. 
            <br>
            <br>
             🧠 The Role – Member of Technical Staff, Full Stack 
            <br>
            <br>
             You’ll join as a core engineer responsible for building product experiences end-to-end: 
            <br>
            <br>
             backend APIs, orchestration logic, and the UI where users interact with autonomous ad agents. 
            <br>
            <br>
             You’ll work alongside LLM engineers and founders to ship production code that matters — touching everything from agent tools to analytics dashboards to ad generation interfaces. 
            <br>
            <br>
             🔧 What You’ll Build 
            <br>
            <br>
            <ul>
             <li>⚙️ Fast APIs — Flask/FastAPI-based endpoints to serve LLM agents, campaigns, user flows</li>
             <li>🎨 Intuitive UI — Build dashboards and workflows with React/Next.js/TypeScript</li>
             <li>🧠 LLM Interfaces — Interfaces to configure, debug, and collaborate with ad agents</li>
             <li>🛠 Real-Time Data Layers — Campaign tracking, spend logs, and performance graphs</li>
             <li>🔁 Full-Stack Features — From data models to UI components to deployment</li>
             <li>🚀 Production-Ready Code — You ship, own, and maintain what you build<br><br></li>
            </ul>💻 Tech Stack 
            <br>
            <br>
             Our stack is fast-moving, agent-native, and optimized for hacker builders: 
            <br>
            <br>
             🧱 Backend &amp; Infra 
            <br>
            <br>
            <ul>
             <li>Python, Flask, FastAPI</li>
             <li>PostgreSQL, Redis, Supabase</li>
             <li>Node.js, Go (occasionally)</li>
             <li>Docker, Railway, AWS (Lambda), GCP</li>
             <li>Serverless + Event-driven architectures (e.g., Kafka, Firebase Functions)<br><br></li>
            </ul>💻 Frontend &amp; UX 
            <br>
            <br>
            <ul>
             <li>React, Next.js, TypeScript</li>
             <li>Tailwind CSS</li>
             <li>Figma → Code handoff culture<br><br></li>
            </ul>🧠 LLM + AI Agents 
            <br>
            <br>
            <ul>
             <li>OpenAI, Claude, Ollama, HuggingFace</li>
             <li>LangChain, LangGraph, CrewAI, AutoGen</li>
             <li>Vector DBs: Weaviate, Qdrant, LanceDB</li>
             <li>LLM debugging: ReAct, CoT traces, Eval tools<br><br></li>
            </ul>🛠 Dev &amp; Ops 
            <br>
            <br>
            <ul>
             <li>GitHub, Cursor, GitHub Copilot, Tabnine</li>
             <li>PostHog, Sentry, LogRocket</li>
             <li>Notion + Slack for async ops and team rituals<br><br></li>
            </ul>💡 What You Bring 
            <br>
            <br>
             ✅ 3+ years of experience in full-stack development at a fast-moving team 
            <br>
            <br>
             ✅ Proficiency in Python (Flask, FastAPI), React, TypeScript, and modern frontend tooling 
            <br>
            <br>
             ✅ You can take a Figma and turn it into a live feature, end-to-end 
            <br>
            <br>
             ✅ Strong understanding of API design, database modeling, auth, and deployment 
            <br>
            <br>
             ✅ Comfort working without full specs — you love figuring things out 
            <br>
            <br>
             ✅ Hacker energy: you automate, debug fast, and ship without drama 
            <br>
            <br>
             🧩 Bonus Points 
            <br>
            <br>
             ✨ Experience building or debugging LLM workflows 
            <br>
            <br>
             🔍 Familiarity with LangChain, CrewAI, or multi-agent orchestration 
            <br>
            <br>
             ⚡ You’ve built performance dashboards or internal tools for operators 
            <br>
            <br>
             🌱 You’ve worked at early-stage startups and worn many hats 
            <br>
            <br>
             💰 Why Join AdsGency AI? 
            <br>
            <br>
            <ul>
             <li>Competitive salary + meaningful equity</li>
             <li>Core technical ownership in a growing AI company</li>
             <li>Build with engineers who value autonomy, speed, and craftsmanship</li>
             <li>No meetings unless they’re useful. No process theater. Just building.</li>
             <li>Work at the frontier of AI + Ad Automation + Multi-Agent Systems<br><br></li>
            </ul>Industry 
            <br>
            <br>
             Software Development 
            <br>
            <br>
             Employment Type 
            <br>
            <br>
             Full-time
           </div>
          </div>
         </div>
         <div>
          <a href="https://www.linkedin.com/jobs/view/member-of-technical-staff-full-stack-at-adsgency-ai-4281845864?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/adsgency-ai-2#content">See more open positions at AdsGency AI</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('San Francisco, CA, USA', NULL, NULL, 'San Francisco, CA, USA', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('United States', NULL, NULL, 'United States', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('California, USA', NULL, NULL, 'California, USA', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('On-site', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/healthie/jobs/56380982-release-engineer#content', 'Release Engineer', 'https://jobs.techstars.com/companies/healthie#content', 'https://cdn.getro.com/companies/c458b2e9-355d-5d7a-a524-701a5756dcce-1748914164', 'Healthie', 'Software Engineering', 1755084838, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Release Engineer</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/c458b2e9-355d-5d7a-a524-701a5756dcce-1748914164" alt="Healthie">
              </div>
             </div>
             <p>Healthie</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering
             </div>
             <div>
              New York, NY, USA
             </div>
             <div>
              USD 115k-145k / year + Equity
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://boards.greenhouse.io/healthie/jobs/4596968005?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <h4><strong>Healthie’s Mission</strong></h4>
           <p>Healthie powers virtual-first care delivery, improving access to healthcare and enabling better healthcare outcomes through technology.</p>
           <p>We build infrastructure that all healthcare organizations need to perform virtual-first care. Between our EHR, scheduling, and patient engagement solutions, Healthie’s API-first approach makes it easy for organizations of every size to build, customize, and scale their business.</p>
           <p>Today, we support thousands of organizations—rannging from small private practices to digital health startups and multi-billion-dollar healthcare companies. Leveraging Healthie, our customers deliver care to millions of patients across the full spectrum of healthcare services — from preventative health and wellness to complex chronic care management.</p>
           <p>We believe the future of healthcare delivery is virtual-first, longitudinal, and collaborative. Learn more at:<a href="https://www.gethealthie.com/"> </a><a href="https://www.gethealthie.com">https://www.gethealthie.com</a></p>
           <h3><strong>About the Role</strong></h3>
           <p>We’re hiring a <strong>Release Engineer</strong> to join our team! In this cross-functional role, you’ll be the engine behind our ability to ship high-quality software reliably and efficiently. You’ll work closely with QA, product squads, and the Platform team to coordinate releases, improve our CI/CD workflows, and ensure that staging environments and release gates are in top shape.</p>
           <h4><strong>Details</strong></h4>
           <ul>
            <li>This is a full-time, hybrid position based in our NYC HQ</li>
            <li>The base salary for this role is $115,000. - $145,000. per year plus equity and annual bonus</li>
           </ul>
           <h3><strong>What You’ll Do</strong></h3>
           <ul>
            <li>Coordinate and manage the release process for multiple product squads.</li>
            <li>Own the release calendar and help plan deployment cadence with engineering leads.</li>
            <li>Ensure CI pipelines for Core teams are healthy, performant, and reflect best practices.</li>
            <li>Proactively triage staging/environment issues and collaborate with Platform to resolve infrastructure blockers.</li>
            <li>Build or improve automation for changelogs, deployment tagging, release notes, and smoke tests.</li>
            <li>Collaborate with QA to ensure test completeness, coverage, and sign-off for releases.</li>
            <li>Support production deployments by Core teams and define processes for rollback and hotfixes.</li>
            <li>Create and monitor metrics related to release frequency, lead time, and post-deploy stability.</li>
           </ul>
           <h3><strong>What You’ll Bring</strong></h3>
           <ul>
            <li>Experience managing software releases or CI/CD workflows in a product engineering environment.</li>
            <li>Familiarity with GitHub Actions, CircleCI, Jenkins, or similar CI systems, including pipeline scripting.</li>
            <li>Understanding of release automation, deployment strategies (blue/green, canary, feature flags), and observability.</li>
            <li>Driven to identify manual processes and systematically automate them with practical, maintainable solutions.</li>
            <li>Scripting skills (Bash, Python etc.) and API Integration experience</li>
            <li>Experience with staging or ephemeral environment management.</li>
            <li>Strong collaboration skills and ability to work across product, QA, and platform teams.</li>
            <li>Passion for making releases boring (in the best way possible).</li>
           </ul>
           <h3><strong>Bonus If You Have</strong></h3>
           <ul>
            <li>Experience in platform engineering, DevOps, or SRE environments.</li>
            <li>Understanding of Docker.</li>
            <li>Familiarity with feature flag systems (e.g., LaunchDarkly, Unleash).</li>
            <li>Exposure to agile product delivery and working in a squad-based org.</li>
           </ul>
           <h4><strong>Interview Process</strong></h4>
           <p>Our interview process is designed to be thoughtful, transparent, and efficient. We’ll move through the stages as quickly as possible. Here’s what you can expect:</p>
           <ul>
            <li>Quick chat with Debbie, AI Recruiter (30 minutes)</li>
            <li>Connect with Katie, Director of Talent (20 minutes)</li>
            <li>Meet Michele, Engineering Manager, QA (30 minutes)</li>
            <li>Take Home Assessment Asynchronous</li>
            <li>Peer Interview with EM’s (45 minutes)</li>
            <li>Executive Interviews with: 
             <ul>
              <li>Jonathan, VP of Engineering (30 minutes)</li>
              <li>Cavan, CTO + cofounder (20 minutes)</li>
             </ul></li>
            <li>References</li>
           </ul>
           <p>To learn more about Working at Healthie &amp; our benefits, <a href="https://www.gethealthie.com/careers">click here</a>.</p>
           <p><em>Healthie participates in e-verify</em></p>
           <div>
            <p><em>Healthie is committed to equal employment opportunity. All qualified applicants will receive consideration for employment without regard to and will not be discriminated against based on age, race, gender, color, religion, national origin, sexual orientation, gender identity, veteran status, disability or any other protected category. We''re proud to be building a diverse and inclusive environment that encourages collaboration, creativity, and growth. Whatever your background, please apply if this is a role that would make you excited to come into work every day.<span> </span></em></p>
           </div>
          </div>
         </div>
         <div>
          <a href="https://boards.greenhouse.io/healthie/jobs/4596968005?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/healthie#content">See more open positions at Healthie</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('New York, NY, USA', NULL, NULL, 'New York, NY, USA', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'United States', 'United States', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Hybrid', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('USD 115k-145k / year', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('115k-145k / year', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/sqor-io-2/jobs/56388942-co-founder-head-of-revenue-cro-track-short-sales-cycle-high-commissions-b2b-saas-sales-successful-startup-experience-a-must-ai-for-bi-platform-significant-equity#content', 'Co-founder, Head of Revenue (CRO Track) - Short Sales Cycle - High Commissions - B2B SaaS Sales - Successful Startup Experience a Must - AI-for-BI Platform (**Significant Equity)', 'https://jobs.techstars.com/companies/sqor-io-2#content', 'https://cdn.getro.com/companies/8595ea82-e43a-5ffc-948c-a8b5f68f114e-1748880290', 'SQOR.io', 'Software Engineering', 1755086965, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Co-founder, Head of Revenue (CRO Track) - Short Sales Cycle - High Commissions - B2B SaaS Sales - Successful Startup Experience a Must - AI-for-BI Platform (**Significant Equity)</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/8595ea82-e43a-5ffc-948c-a8b5f68f114e-1748880290" alt="SQOR.io">
              </div>
             </div>
             <p>SQOR.io</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, Sales &amp; Business Development, Data Science
             </div>
             <div>
              United States
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://www.linkedin.com/jobs/view/co-founder-head-of-revenue-cro-track-short-sales-cycle-high-commissions-b2b-saas-sales-successful-startup-experience-a-must-ai-for-bi-platform-significant-equity-at-sqor-ai-4283780614?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <p><strong>Head of Revenue (Player/Coach) – B2B SaaS AI-for-BI Platform </strong></p>
            <p><em>Track to CRO – We need you to prove yourself by selling and putting revenue on the board.</em></p>
            <p><em>**Only US/Canada-Based Should Apply.</em></p>
            <p><em>*** MUST be ready and revving to start.</em></p>
            <p><strong>About SQOR.ai </strong></p>
            <p>SQOR.ai has reimagined Business Intelligence for the modern AI era with a plug-and-play Generative BI platform built on Agentic AI. We provide AI Agents-as-a-Service (AaaS) that unlocks real-time, no-code visibility into 500+ KPIs across every major SaaS tool in a company, without the cost, complexity, or dependency on data teams.</p>
            <p>Our platform empowers leaders, investors, and operators with AI-powered insights and decision intelligence directly from the tools they already use; simply authenticate We eliminate the blind spots and bottlenecks of traditional BI and instead provide automatic intelligence they can act on immediately.</p>
            <p><strong>Role Summary </strong></p>
            <p>We’re hiring an experienced Startup Head of Revenue (Player/Coach) HUNTER to lead from the front; finding deals, closing deals, and managing a lean but growing team of hunters, laying the foundation to earn the Chief Revenue Officer role. This is not a title for show. It''s a title you will earn through performance, leadership, and ownership of results.</p>
            <p>You will immediately manage our existing team of salespeople while driving revenue personally. If you''re the kind of leader who earns respect by doing the work, hitting targets, and raising the bar, this is your role to take.</p>
            <p>NOTE: This is not a passive, email-driven role, even though we are ramping up an inbound email program. This role is for a HUNTER / CLOSER and connector; someone who thrives in live conversations, builds momentum quickly, and gets people to "yes." Whether through direct outreach, events, warm intros, or channel partnerships, you know how to create urgency and land the deal. You’ll be selling a category-defining <strong>Generative Business Intelligence (Gen BI) </strong>platform to a market that needs it yesterday, and you’ll be coaching and mentoring our team do the same.</p>
            <p><strong><em>Watch Company Video: https://youtu.be/Aff-rX9W_TE?si=0Sm9js8MOkdxrSKN</em></strong></p>
            <p><strong>Ideal Candidate </strong></p>
            <p><strong>You''re experienced selling as part of startup and kicking off growth (and have the REFERENCES to prove it. You are comfortable selling into mid-market companies, venture-backed startups (Series B to D), and to Private Equity who need realtime portfolio metrics to do what they do. You have a track record of managing and motivating sales teams while also carrying and closing your own quota. You''ve sold SaaS, analytics, AI, or BI tools—and you know how to engage C-level buyers. Experience selling to VCs, private equity, or into their portfolio companies is a big plus.</strong></p>
            <p><strong>Compensation </strong></p>
            <p><strong>This role includes a meaningful ownership stake and high-impact cash incentives. </strong>You will receive approximately 2 percent equity in SQOR.ai and earn Very High Commissions on all revenue you personally close until base salaries are available in Q3 2025 and a small percentage of your sales team''s closed/won. The compensation plan will transition to include a competitive salary and commissions aligned with market rates. This structure is designed to reward builders and closers; those who show up to win and help the company scale rapidly. And we are 22 people here working exclusively on equity in order to grab a big piece of this pie.</p>
            <p><strong>Key Responsibilities </strong></p>
            <p>- Lead and coach an existing team of salespeople while also directly generating revenue through your own pipeline.</p>
            <p>- Personally close high-value deals targeting executive decision-makers across finance, operations, IT, and data.</p>
            <p>- Build and refine the sales strategy, including ICP targeting, pitch evolution, and performance metrics.</p>
            <p>- Identify and develop channel, VC, and referral partnerships to expand lead flow and shorten cycles.</p>
            <p>- Maintain strong client relationships through high-impact, consultative engagement that leads to expansion and retention.</p>
            <p>- Act as the bridge between the market and the company—providing real-time insights to product and marketing.</p>
            <p><strong>Qualifications </strong></p>
            <p>- 5 to 10+ years of success in Startup B2B SaaS sales, with at least 2 years managing and leading sales teams</p>
            <p>- Deep startup experience closing mid-market and enterprise deals with C-suite stakeholders</p>
            <p>- Proven track record of beating quota and building revenue engines in early-stage or high-growth companies</p>
            <p>- Strong communication, negotiation, and leadership skills, with an entrepreneurial mindset</p>
            <p>- Based in NYC or another major tech hub with a strong personal network preferred, though remote is possible for top performers</p>
            <p><strong>Why Join SQOR.ai </strong></p>
            <p>You’re joining a rocket ship 🚀, not a cruise ship.🛳️ *** Only apply if you are ready to suit up and go for that startup rocket ride.</p>
            <p>Our platform is already being used by over 340 companies. We’ve built 60+ agentic intelligence modules and created a frictionless way for companies to get real-time, AI-powered insights from their existing SaaS tools. This is your chance to shape how a market understands and adopts a whole new category of decision intelligence. You’ll own a meaningful stake, lead a high-performance team, and have a front-row seat to one of the most exciting growth stories in AI</p>
            <p>.</p>
           </div>
          </div>
         </div>
         <div>
          <a href="https://www.linkedin.com/jobs/view/co-founder-head-of-revenue-cro-track-short-sales-cycle-high-commissions-b2b-saas-sales-successful-startup-experience-a-must-ai-for-bi-platform-significant-equity-at-sqor-ai-4283780614?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/sqor-io-2#content">See more open positions at SQOR.io</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('United States', NULL, NULL, 'United States', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/go-to-u/jobs/56389113-qa-engineer#content', 'QA Engineer', 'https://jobs.techstars.com/companies/go-to-u#content', 'https://cdn.getro.com/companies/8e6c4116-2266-5d43-8b03-a4cd4971ef03-1747617328', 'Go To-U', 'Software Engineering', 1755087006, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>QA Engineer</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/8e6c4116-2266-5d43-8b03-a4cd4971ef03-1747617328" alt="Go To-U">
              </div>
             </div>
             <p>Go To-U</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, Quality Assurance
             </div>
             <div>
              Lviv, Lviv Oblast, Ukraine,
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://ua.linkedin.com/jobs/view/qa-engineer-at-go-to-u-4283548247?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <p>About the Role:</p>
            <p>We are looking for a skilled QA Engineer (Middle+) to help establish and improve manual and automated testing processes while contributing to smooth release cycles. You will work on a mobile application related to electric vehicles and charging stations, directly impacting an innovative and fast-growing industry. This role combines hands-on testing with participation in QA process improvements.</p>
            <p>Key Responsibilities:</p>
            <p>Perform manual testing for web, mobile, and desktop applications.Understand and test client-server architecture.Participate in creating and optimizing QA processes for manual and automated testing.Support and maintain test automation scripts for regression and functional testing.Collaborate closely with development, DevOps, and product teams to ensure product quality.Configure and run automated testing frameworks (UI, API, Mobile, Performance).Analyze defects, create reports, and ensure critical functionality coverage.Contribute to release readiness and quality validation.Requirements:</p>
            <p>3+ years of QA experience.Understanding of CI/CD processes and basic experience with test environments.Experience with some of the following tools and technologies:Docker, Jenkins, AWS, SQS/SNSJava, Gradle, Kotlin, STOMP, MySQLTesting frameworks: Gatling, Playwright, JUnit5, RestAssuredUnderstanding of performance and load testing basics.Good communication skills and ability to work effectively in a team.English level: Intermediate+ (for team communication and documentation).Preferred Qualifications:</p>
            <p>Understanding of QA metrics and release management basics.Nice to have</p>
            <p>Experience with KOTLIN (KTOR)/ Java (SPRING) and performance testing.What We Offer:</p>
            <p>An opportunity to influence the quality of an innovative product in the EV industry.A friendly and collaborative team of professionals.Competitive salary.Flexible work schedule and remote work options.Opportunities for learning, growth, and professional development.</p>
            <p>About GO TO-U</p>
            <p>GO TO-U is set to revolutionize the EV charging experience! Join now to benefit from unique booking features, remote control over the charging station, and marketing and PR tools. We are the experts in EV charging infrastructure development, providing consultancy for the cities and large corporations since 2014. We have worked globally since 2017 to bring the best EV charging experience. Now, we give information on more than 700,000 charging stations worldwide! In 2020, GO TO-U became a Techstars family member. Before that, GO TO-U benefited from the IMPACT Accelerator program, EU HORIZON2020 funds. ABB’s E-mobility division strengthened global leadership with GO TO-U investment in 2021.</p>
           </div>
          </div>
         </div>
         <div>
          <a href="https://ua.linkedin.com/jobs/view/qa-engineer-at-go-to-u-4283548247?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/go-to-u#content">See more open positions at Go To-U</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('Lviv, Lviv Oblast, Ukraine,', NULL, NULL, 'Lviv, Lviv Oblast, Ukraine,', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/reppls/jobs/56389258-senior-devops-engineer#content', 'Senior DevOps engineer', 'https://jobs.techstars.com/companies/reppls#content', 'https://cdn.getro.com/companies/27dfcaa0-24b3-5092-82b7-8f56511fca45-1755101722', 'Reppls', 'Software Engineering', 1755087028, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Senior DevOps engineer</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/27dfcaa0-24b3-5092-82b7-8f56511fca45-1755101722" alt="Reppls">
              </div>
             </div>
             <p>Reppls</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering
             </div>
             <div>
              Poland
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://pl.linkedin.com/jobs/view/senior-devops-engineer-at-reppls-4283454565?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <p><strong>GameDev</strong> студия в поиске <strong>Senior DevOps engineer</strong> для работы над веб3 action MMORPG 🚀</p>
            <p>Проект уже в активном лаунче и имеет сформировавшееся комьюнити, активно использующее серверы. Команда разработки растет, а в ближайшем будущем планируется листинг токена на бирже, что откроет новые возможности для монетизации и увеличит ответственность инфраструктурной команды.</p>
            <p>🌴 remote</p>
            <p>⏰ Full-time</p>
            <p>💡 <strong>Кого мы ищем:</strong></p>
            <ul>
             <li>Опыт работы с AWS. GCP, Azure, Ali, Yandex Cloud также рассматриваем</li>
             <li>Глубокие знание kubernetes, опыт развертывания и оперирования</li>
             <li>Опыт работы с terraform, реализации своих модулей</li>
             <li>Практический опыт описания CI\CD пайплайнов, helm чартов</li>
             <li>Уверенные знания Prometheus, Alertmanager, VictoriaMetrics</li>
             <li>Опыт работы Redis, MongoDB, PostgreSQL</li>
            </ul>
            <p><em>Nice to have:</em></p>
            <ul>
             <li>Внедрял keda, мигрировал с cas на karpenter</li>
             <li>Внедрял DR, DRP процедуры house и load тестирование.</li>
             <li>Реализовывал удобное управление и доставку секретов и конфигураций</li>
            </ul>
            <p>⚙️ <strong>Что нужно будет делать:</strong></p>
            <ul>
             <li>Рефакторинг CI с последующим переходом на нее всех сервисов</li>
             <li>Внедрить Vault, мигрировать с plain конфигураций в секреты</li>
             <li>Мигрировать MongoDB из self-hosted развертывания, в MongoDB Atlas</li>
             <li>Реализовать отдельные контуры для нагрузочного тестирования</li>
             <li>Рефакторинг существующих правил алертинга и observability стека в целом</li>
            </ul>
            <p>💎 <strong>Мы предлагаем:</strong></p>
            <ul>
             <li>Возможность поучаствовать в разработке уникального и амбициозного проекта</li>
             <li>Сложные и интересные задачи, полностью удаленная работа</li>
             <li>Зарплата исходя из ваших пожеланий</li>
             <li>Есть опция релокации, оформления в Абу-Даби (ОАЭ)</li>
            </ul>
           </div>
          </div>
         </div>
         <div>
          <a href="https://pl.linkedin.com/jobs/view/senior-devops-engineer-at-reppls-4283454565?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/reppls#content">See more open positions at Reppls</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('Poland', NULL, NULL, 'Poland', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/branch-3-a4891960-b9e6-4363-8451-d5b932ec1154/jobs/56350302-senior-treasury-analyst#content', 'Senior Treasury Analyst', 'https://jobs.techstars.com/companies/branch-3-a4891960-b9e6-4363-8451-d5b932ec1154#content', 'https://cdn.getro.com/companies/6b3358fb-c1dd-5393-ba2f-31dd0cc5a673-1749000799', 'Branch', 'Software Engineering', 1755079437, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Senior Treasury Analyst</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/6b3358fb-c1dd-5393-ba2f-31dd0cc5a673-1749000799" alt="Branch">
              </div>
             </div>
             <p>Branch</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, IT, Accounting &amp; Finance
             </div>
             <div>
              United States · Remote
             </div>
             <div>
              USD 105k-120k / year + Equity
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://boards.greenhouse.io/branch/jobs/6680970003?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <p><strong>About us:</strong></p>
           <p>Branch is on a mission to empower workers with financial freedom. We do this by helping companies accelerate payments and providing working Americans with accessible, free financial services. We’re committed to building and delivering more inclusive, transparent, and frictionless financial products.</p>
           <p>Our goal of empowerment extends to our own employees, too. Have a great idea? Share it today and it might just get implemented tomorrow. As a member of our team, your voice and creativity matter—and they can directly impact our products, company, and culture.</p>
           <p>We not only focus on attracting great talent from across the country, but also on building teams that help that talent thrive. That means valuing a diversity of opinions and working styles, while creating a shared belief in innovation, initiative, and winning together.</p>
           <p>Come join our team as we develop new ways to improve the lives of working Americans.</p>
           <p><strong>About the role:</strong></p>
           <p>As a member of the accounting team at Branch, you’ll have the opportunity to shape and grow the company and business. You will be a key player of a small team comprised of high performing accounting and finance professionals that work across departments to provide financial support to senior management and department leaders to facilitate decision making. The Senior Treasury Analyst will be responsible for managing our company’s cash flow, investments, and financial risk to maximize efficiency and profitability. The role requires a strong understanding of the FinTech industry, excellent analytical skills, and the ability to work effectively in a fast-paced environment.</p>
           <p><strong>Responsibilities include, but are not limited to:</strong></p>
           <ul>
            <li>Manage relationships with banking institutions, coordinating account setup and maintenance, service and process updates, and resolution of banking issues</li>
            <li>Record and reconcile bank activity for cash accounts, ensuring timely and accurate alignment with internal financial systems</li>
            <li>Monitor daily cash positions and manage liquidity to ensure sufficient funds for operational needs</li>
            <li>Optimize cash concentrations and disbursements, and develop strategies to maximize operational efficiency</li>
            <li>Conduct regular cash flow forecasting and update as necessary to reflect changing business conditions</li>
            <li>Prepare accurate and timely financial reports detailing the company’s treasury activities, including cash positions, forecasts, and variances</li>
            <li>Leverage technology to improve treasury operations, including the use of treasury management systems</li>
            <li>Recommend and implement process improvements to increase efficiency and accuracy of treasury operations</li>
            <li>Ensure compliance with internal controls, policies, and regulatory reporting requirements.</li>
            <li>Perform special projects as assigned</li>
           </ul>
           <p><strong> Qualifications: </strong></p>
           <ul>
            <li>Bachelor’s degree in Accounting or Finance required</li>
            <li>5+ years of treasury experience (experience at a high growth FinTech company is required)</li>
            <li>Working knowledge of US <span><span><span>GAAP</span></span></span> and technical accounting</li>
            <li>Intermediate to advanced level Excel skills with experience working with large amounts of data</li>
            <li>Sage Intacct experience is a plus</li>
            <li>Excellent communication and interpersonal skills, with the ability to interact with various stakeholders</li>
            <li>Proven ability to work independently and as part of a team in a dynamic and complex environment</li>
           </ul>
           <p><strong>Compensation:</strong></p>
           <p>The salary range for this role is <span>$105-120k.</span></p>
           <p>The salary range displayed reflects an average base salary range for the position across all the U.S. The base salary offered to an applicant could be higher or lower based on each applicant''s specific skill set, depth of experience, relevant education or training, etc.</p>
           <p><strong>Location:</strong></p>
           <p>This position is classified as REMOTE<strong> </strong>within the United States of America.</p>
           <p><em>We are unable to hire candidates located outside of the domestic U.S.</em></p>
           <p><strong>Benefits: </strong></p>
           <ul>
            <li>Market-leading medical, dental, and vision insurance</li>
            <li>Stock options</li>
            <li>Free Premium-Tier Origin Financial Wellness subscription</li>
            <li>Monthly home-office stipend</li>
            <li>401k (TransAmerica)</li>
            <li>12-weeks paid parental leave for birthing and non-birthing parents</li>
            <li>Flexible time off + sick and safe time</li>
            <li>11 paid company holidays</li>
           </ul>
           <p><strong>Working at Branch:</strong></p>
           <p>A remote-first company with employees located throughout the U.S., Branch emphasizes transparency, accountability, and trust to create a collaborative environment where our product, engineering, marketing, customer support, customer success, and sales teams can all thrive together. Learn more about what we do in this <a href="https://cdn.bfldr.com/CUTY2K5N/as/jrr3hk6csnwjhrx8phg6ppnj/The_Branch_Manifesto"><u>video</u></a>!</p>
           <p>Our collaborative spirit has helped us become an award-winning FinTech company, with Branch’s innovation and workplace recognized across industries. Branch has been honored by Inc., the Webby Awards, Benzinga FinTech Awards, FinTech Breakthrough Awards, Top Workplaces USA, Great Places to Work, and EY Entrepreneur of the Year, Heartland, among others.</p>
           <p>Learn more about our culture, approach, technology, and people here:<span><span><span> <a href="https://www.branchapp.com/about">https://www.branchapp.com/about</a></span></span></span></p>
           <p></p>
           <p><em>Branch is an equal opportunity employer and we value diversity at our company. We do not discriminate on the basis of race, religion, color, national origin, gender, sexual orientation, age, marital status, veteran status, or disability status.</em></p>
           <p><em>Must be currently authorized to work in the USA without sponsorship or transfer.</em></p>
           <p><em>No third-parties, please.</em></p>
           <p><em><u>View how Branch collects your personal data </u></em><a href="https://www.branchapp.com/legal/ccpa"><em><u>here</u></em></a><em><u>.</u></em></p>
          </div>
         </div>
         <div>
          <a href="https://boards.greenhouse.io/branch/jobs/6680970003?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/branch-3-a4891960-b9e6-4363-8451-d5b932ec1154#content">See more open positions at Branch</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('United States', NULL, NULL, 'United States', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('USD 105k-120k / year', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('105k-120k / year', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/we-make-change-2/jobs/56388539-web-developer#content', 'Web Developer', 'https://jobs.techstars.com/companies/we-make-change-2#content', 'https://cdn.getro.com/companies/1ede8dab-3a90-589f-a4cc-b9c88bf8549a-1755101334', 'We Make Change', 'Software Engineering', 1755086815, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Web Developer</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/1ede8dab-3a90-589f-a4cc-b9c88bf8549a-1755101334" alt="We Make Change">
              </div>
             </div>
             <p>We Make Change</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering
             </div>
             <div>
              London, UK · London, UK · London, UK
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://uk.linkedin.com/jobs/view/web-developer-at-we-make-change-4284099276?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <p><strong>Support a startup tackling child poverty in rural Kenya 🇰🇪</strong></p>
            <p><strong>Rising Capacities for Children Africa (RICCA)</strong></p>
            <p><span>Rising Capacities for Children Africa (RICCA) tackles child poverty in rural Kenya, especially in Kirinyaga County, by creating inclusive, child-friendly learning environments. Through the Ricca Afterschool Center, children aged 6–17 access personalized support, mentorship, and engaging programs in arts, sports, agriculture, and digital literacy. These activities foster academic success, creativity, social skills, and life competencies while making learning fun and accessible. RICCA also works with schools to improve teacher quality, infrastructure, and resources, and engages parents in the process. By bridging rural–urban gaps and promoting intercultural dialogue, RICCA empowers communities, protects children’s rights, and breaks cycles of poverty through education.</span></p>
            <p><strong>Role (Volunteer): </strong><span>Web Developer.</span></p>
            <p><strong>Role Description: </strong></p>
            <p>About Us</p>
            <p>Kenneth, the founder witnessed high school dropout rates in rural Kenya, caused by poverty, inadequate facilities, teacher shortages, and cultural biases, forcing many children into child labor or crime. This motivated him to found a social venture, RICCA, which establishes child-friendly, inclusive afterschool centers in rural Kenya. These centers offer a safe space for homework, tutoring, and creative skill development (music, art, computer). Children also engage in sports and sustainable agriculture, bridging urban/rural gaps. RICCA aims to provide quality education and reduce child poverty, fostering well-rounded individuals regardless of their background.</p>
            <p>Role Description</p>
            <p>RICCA is seeking a skilled web development volunteer to enhance our existing website. Key tasks include: adding child-focused design elements, improving navigation, linking with active social media, fixing the donation button, adding features like newsletter subscriptions, volunteer, donor engagement pages, and safeguarding resource hubs, as well as embedding key policies (privacy, donor privacy, safeguarding, terms of use). Your work will boost our advocacy, fundraising, and programme visibility.</p>
            <p>Ideal Candidate</p>
            <p>Experience with modern web designs or website builders (especially WordPress is a major plus. A good eye for design and user experience, with the ability to create child-friendly, visually engaging layouts. A passion for telling RICCA’s story through technology, enhancing advocacy, and improving user engagement. A genuine interest in our mission to provide quality education, reduce child poverty, and empower marginalized rural children in Kenya.</p>
            <p><strong>Time Commitment: </strong><span>Volunteer 4-6 hours per week for 3-5 months remotely 💻</span></p>
            <p><strong>If you want to make change, apply to volunteer with RICCA!</strong></p>
           </div>
          </div>
         </div>
         <div>
          <a href="https://uk.linkedin.com/jobs/view/web-developer-at-we-make-change-4284099276?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/we-make-change-2#content">See more open positions at We Make Change</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('London, UK', NULL, NULL, 'London, UK', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'United Kingdom', 'United Kingdom', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'United States', 'United States', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/kepler-communications-2/jobs/56377167-hardware-test-engineer#content', 'Hardware Test Engineer', 'https://jobs.techstars.com/companies/kepler-communications-2#content', 'https://cdn.getro.com/companies/c24d89fd-21b5-5f32-a9b7-c11e5826173d-1748310180', 'Kepler Communications', 'Software Engineering', 1755084259, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Hardware Test Engineer</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/c24d89fd-21b5-5f32-a9b7-c11e5826173d-1748310180" alt="Kepler Communications">
              </div>
             </div>
             <p>Kepler Communications</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, Other Engineering, Quality Assurance
             </div>
             <div>
              Toronto, ON, Canada
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://jobs.lever.co/kepler/79f29f90-7f7d-446a-905a-6c317e013903?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <span><b>At <a href="https://kepler.space/">Kepler Communications</a>, we''re not just imagining the future of connectivity - <i>we''re leading it!</i></b></span>
           </div>
           <div>
            <span>Our mission is to provide real-time Internet access in space, enabling a new era of data-driven exploration and innovation. With 23 satellites already launched and a next-generation optical network on the way, we’re creating the infrastructure that will power the space economy for decades to come. </span>
           </div>
           <div>
            <span>Technology is only part of the story. <b>What sets Kepler apart is our team:</b> bold thinkers, skilled builders, and passionate problem-solvers who thrive on pushing the boundaries of what’s possible in space. We believe great ideas come from diverse perspectives, and we’re committed to creating an environment where you can grow, lead, and make a global impact. </span>
           </div>
           <div>
            <span>If you’re ready to reach higher, move faster, and do work that shapes the future space economy - <i>this is your launchpad. </i><b>Come build the future with Kepler! </b></span>
           </div>
           <div>
            <span><b><u>What We Offer:</u></b></span>
           </div>
           <div>
            <b><span>- Competitive compensation</span></b><span> with a robust equity plan to share in our success. </span>
           </div>
           <div>
            <b><span>- Comprehensive coverage for health, dental, and vision insurance</span></b><span>—including dependents. </span>
           </div>
           <div>
            <b><span>- Unlimited vacation, supportive parental leave policy,</span></b><span> and company-wide holiday shutdown. </span>
           </div>
           <div>
            <b><span>- Semi-annual company-wide parties</span></b><span> and frequent in-office team events. </span>
           </div>
           <div>
            <b><span>- Relocation packages</span></b><span> available for approved roles. </span>
           </div>
           <div>
            <b><span>- $1,500 annual professional development fund</span></b><span> to support your growth. </span>
           </div>
           <div>
            <b><span>- Fully stocked Toronto office kitchen</span></b><span> with snacks, drinks, games and top-notch kitchen appliances. </span>
           </div>
           <div>
            <b><span>- Town Halls, Celebration Calls, and Company-wide events</span></b><span> to stay connected and engaged. </span>
           </div>
           <div>
            <b><span>- We’re a certified </span><a href="https://www.greatplacetowork.ca/en/certification-menu/certified-organizations-updated#certified-organizations2/view-sub-list-details70/5f3438830d6f2900170827a4/"><span>Great Place to Work</span></a></b><span>®, four years in a row!</span>
           </div>
           <div>
            <span>We’re looking for a </span><b>Hardware Test Engineer </b><span>who is passionate about designing cutting-edge test infrastructure and validating hardware that will operate in the harshest conditions of space.</span>
           </div>
           <div>
            <span>If you bring technical excellence in test engineering for aerospace, electronics, or mission-critical systems and thrive in fast-paced, hands-on environments we want to hear from you.</span>
           </div>
           <h3>Key Responsibilities:</h3>
           <ul>
            <li>Design and implement test procedures, fixtures, and software for PCBs, subassemblies, and complete systems</li>
            <li>Create both manual and automated test setups using lab and production-grade equipment</li>
            <li>Develop and maintain test scripts to improve test efficiency and repeatability</li>
            <li>Develop comprehensive test plans, test cases, and test reports that align with design specifications and customer requirements</li>
            <li>Maintain traceability and detailed records for auditing and continuous improvement</li>
            <li>Interface with electrical, firmware, mechanical, and manufacturing teams to validate new designs, provide DFT (Design for Test) feedback, and resolve test issues across the development lifecycle</li>
            <li>Support prototype bring-up and debug, assist with root cause analysis of test failures, and implement corrective actions</li>
            <li>Collaborate with hardware design teams early in the development cycle to provide DFT feedback, ensuring testability of PCBs and assemblies</li>
            <li>Participate in design reviews for all active designs to ensure test requirements have been met</li>
           </ul>
           <h3>Required Skills &amp; Qualifications:</h3>
           <ul>
            <li>Bachelor’s degree in Electrical Engineering, Computer Engineering, or related field</li>
            <li>2+ years of hands-on experience in hardware testing, design validation, or a related field</li>
            <li>Comfortable in a lab environment and experience using standard tools such as oscilloscopes, spectrum analyzers, multimeters, VNAs, etc.</li>
            <li>Experience with at least one scripting or programming language; Python, MATLAB, Bash, and/or C/C++</li>
            <li>Ability to work in a team and independently with little supervision</li>
            <li>Experience with one or more CAD tools; Altium, Eagle, Allegro, KiCad, and/or Upverter</li>
            <li>Ability to troubleshoot hardware issues, drive design decisions and implement well documented processes</li>
           </ul>
           <h3>Bonus Points:</h3>
           <ul>
            <li>Knowledge and/or experience in design and/or testing for Space</li>
            <li>Test experience in a low volume + high complexity environment</li>
           </ul>
           <div>
            <span><b>Use of AI in Recruitment</b></span>
           </div>
           <div>
            <span>At Kepler Communications, all hiring decisions are made by people. Human recruiters are involved in every step of our recruitment process. We use AI-based tools (such as Lever AI and HireEZ) to assist with the initial review of applications by ranking candidates based on job-relevant criteria. These tools support - but do not replace - human judgment.</span>
           </div>
           <div>
            <b>Employment Equity &amp; Accommodation Statement</b><span> </span>
           </div>
           <div>
            <span>Kepler Communications is an equal opportunity employer committed to building a diverse and inclusive workplace. We welcome applications from all qualified individuals, including women, Indigenous peoples, persons with disabilities, members of visible minorities, and people of all sexual orientations and gender identities. </span>
           </div>
           <div>
            <span>If you require accommodation during any stage of the recruitment process, please contact our People &amp; Culture team at </span><a href="https://jobs.techstars.com/companies/kepler-communications-2/jobs/56377167-hardware-test-engineer#">accommodation@kepler.space</a><span>, and we will work with you to meet your needs. </span>
           </div>
          </div>
         </div>
         <div>
          <a href="https://jobs.lever.co/kepler/79f29f90-7f7d-446a-905a-6c317e013903?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/kepler-communications-2#content">See more open positions at Kepler Communications</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('Toronto, ON, Canada', NULL, NULL, 'Toronto, ON, Canada', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'Canada', 'Canada', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/safeflight/jobs/56387584-machine-shop-supervisor#content', 'Machine Shop Supervisor', 'https://jobs.techstars.com/companies/safeflight#content', 'https://cdn.getro.com/companies/7721637a-19c5-538b-aae0-131cbf5e6cf5-1747532181', 'SafeFlight', 'Software Engineering', 1755085926, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Machine Shop Supervisor</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/7721637a-19c5-538b-aae0-131cbf5e6cf5-1747532181" alt="SafeFlight">
              </div>
             </div>
             <p>SafeFlight</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering, People &amp; HR, Operations
             </div>
             <div>
              White Plains, NY, USA
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://safeflight.hireclick.com/jb/machine-shop-supervisor/view/194757?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board#title">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <span>
            <p><span><strong>Machine Shop Supervisor Job Description</strong></span></p>
            <p><strong>About Us:</strong></p>
            <p><span>Safe Flight, a leader in aviation safety and flight performance systems, was founded in 1946. The company pioneered the development of Stall Warning and Angle of Attack, Automatic Throttle Systems, Wind Shear Warning, and many other innovations in aircraft instrumentation, flight performance, and control systems for fixed and rotary winged aircraft. With product installed on over two-thirds of the world’s aircraft, Safe Flight counts among its customers the majority of the world’s aircraft manufacturers, more than 50 airlines, hundreds of operators of corporate jet aircraft and U.S. and International Armed Services.</span></p>
            <p><span><strong>Safe Flight’s benefits</strong> include employer-funded health care, on-site lunch program, 401K contribution, Wellness and Education Reimbursement, paid-time off and sick time, and various other programs.</span></p>
            <p><strong>Duties/Responsibilities:</strong></p>
            <ul>
             <li><i><span>Lead, motivate, and mentor a team of machinists to achieve production goals and maintain a positive working environment.</span></i></li>
             <li><i><span>Assign tasks and responsibilities to team members, ensuring a smooth workflow.</span></i></li>
             <li><i><span>Conduct regular meetings to communicate goals, priorities, and performance expectations</span></i></li>
             <li><i><span>Monitor the production process, ensuring that all punches and dies are manufactured accurately and efficiently.</span></i></li>
             <li><i><span>Collaborate with engineers and designers to review blueprints, specifications, and project requirements.</span></i></li>
             <li><i><span>Provide hands-on support to your team by filling in on job operations if no one is available at the time to keep the critical production processes moving forward</span></i></li>
             <li><i><span>Implement and enforce quality control procedures to maintain the highest standards of precision and craftsmanship (address any quality concerns and implement corrective actions).</span></i></li>
             <li><i><span>Troubleshoot machine /programming errors</span></i></li>
             <li><i><span>Conduct safety training and ensure that all team members adhere to safety regulations to promote a safe working environment.</span></i></li>
             <li><i><span>Performs other related duties as assigned.</span></i></li>
            </ul>
            <p><strong>Required Skills/Abilities:</strong></p>
            <ul>
             <li><a href="https://jobs.techstars.com/companies/safeflight/jobs/56387584-machine-shop-supervisor#"><span>Excellent verbal and written communication skills.</span></a></li>
             <li><span>Working knowledge of manufacturing processes, including CNC machining, grinding, and (CNC programming and CAD proficiency are a plus)</span></li>
             <li><span>Proficiency in reading blueprints and technical drawings.</span></li>
            </ul>
            <p><span><strong>Education and Experience:</strong></span></p>
            <ul>
             <li><span>High school diploma or equivalent (Bachelor''s degree in a related field is a plus).</span></li>
             <li><span>7+ years of successful leadership experience required. Internal candidates with a demonstrated track record of success within the organization may be considered for this position with a reduced requirement for external experience.</span></li>
            </ul>
            <p><i><span><strong>Other duties</strong></span></i></p>
            <p><i><span>Please note this job description is not designed to cover or contain a comprehensive listing of activities, duties or responsibilities that are required of the employee for this job. Duties, responsibilities and activities may change at any time with or without notice.</span></i></p>
            <p><i><span><strong>Equal Opportunities Employer</strong></span></i></p>
            <p><i><span>Safe Flight provides equal employment opportunities to all employees and applicants for employment and prohibits discrimination and harassment of any type without regard to race, color, religion, age, sex, national origin, disability status, genetics, protected veteran status, sexual orientation, gender identity or expression, or any other characteristic protected by federal, state or local laws.</span></i></p>
            <p><i><span>This policy applies to all terms and conditions of employment, including recruiting, hiring, placement, promotion, termination, layoff, recall, transfer, leaves of absence, compensation and training.</span></i></p></span>
          </div>
         </div>
         <div>
          <a href="https://safeflight.hireclick.com/jb/machine-shop-supervisor/view/194757?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board#title">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/safeflight#content">See more open positions at SafeFlight</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('White Plains, NY, USA', NULL, NULL, 'White Plains, NY, USA', (SELECT * FROM last_id));
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (NULL, NULL, 'United States', 'United States', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('401K', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('On-site', (SELECT * FROM last_id));
DROP TABLE last_id;

INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, 'https://jobs.techstars.com/companies/veho/jobs/56387901-senior-software-engineer-developer-platform#content', 'Senior Software Engineer, Developer Platform', 'https://jobs.techstars.com/companies/veho#content', 'https://cdn.getro.com/companies/569ed972-2ef5-548f-99bb-b3dceaee66bc-1749001216', 'Veho', 'Software Engineering', 1755086065, '<div></div>
<div>
 <div>
  <div>
   <div>
    <div></div>
   </div>
  </div>
  <div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <img alt="hero" src="https://cdn.getro.com/collections/21d1bd6c-49e3-5d81-a799-5af7da862936-1717081323">
      <div>
       <div>
        <div>
         <div>
          <div>
           <div></div>
           <div>
            companies
           </div>
          </div>
          <div>
           <div></div>
           <div>
            Jobs
           </div>
          </div>
         </div>
        </div>
       </div>
       <div>
        If you are a Techstars portfolio company,&nbsp;<a href="https://www.getro.com/app/claim-your-profile/techstars">claim your profile</a>.
       </div>
      </div>
     </div>
    </div>
    <div>
     <div>
      <div>
       <a href="https://jobs.techstars.com/jobs">
        <div>
         Search&nbsp;
        </div>jobs</a><a href="https://jobs.techstars.com/companies">
        <div>
         Explore&nbsp;
        </div>companies</a><a href="https://jobs.techstars.com/talent-network">
        <div>
         Join talent network
        </div>
        <div>
         Talent
        </div></a>
       <div>
        <div>
         My&nbsp;<span>job&nbsp;</span>alerts
        </div>
       </div>
      </div>
     </div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <h2>Senior Software Engineer, Developer Platform</h2>
            <div>
             <div>
              <div>
               <img src="https://cdn.getro.com/companies/569ed972-2ef5-548f-99bb-b3dceaee66bc-1749001216" alt="Veho">
              </div>
             </div>
             <p>Veho</p>
            </div>
           </div>
           <div>
            <div>
             <div>
              Software Engineering
             </div>
             <div>
              Bogotá, Bogota, Colombia · Remote
             </div>
             <div>
              Posted on Aug 13, 2025
             </div>
            </div>
           </div>
          </div>
          <div>
           <a href="https://jobs.gem.com/veho-technologies/am9icG9zdDoXhIequOl_CQAG1WBaO2kD?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
            <div>
             <div>
              Apply now
             </div>
            </div></a>
          </div>
         </div>
         <div>
          <div>
           <div>
            <div>
             Senior Software Engineer, Developer Platform
            </div>
            <div>
             <div>
              <i></i>
              <div>
               <span>Remote - Bogota, Colombia</span>
              </div>
             </div>
             <div>
              <i></i>
              <div>
               Engineering
              </div>
             </div>
             <div>
              <i></i>
              <div>
               Remote
              </div>
             </div>
             <div>
              <i></i>
              <div>
               Full-time
              </div>
             </div>
            </div>
            <div>
             <div>
              <h3><strong>About Veho</strong></h3>
              <div>
               The mission of the Developer Platform team is to enable the Engineering organization to deliver great products faster, more efficiently, and at scale. The team is dedicated to continuously improving the developer experience by implementing exceptional tools, paved paths, and developer-friendly APIs that abstract away complexity and empower our engineers to focus on delivering value to our customers.
              </div>
              <div>
               We are seeking an experienced Senior Software Engineer with expertise in cloud (AWS preferred) infrastructure and developer experience to join our dynamic team. In this role, you will design and implement scalable, reliable services while streamlining developer workflows to enhance software delivery. By collaborating with cross-functional teams, you''ll play a key role in equipping our engineering organization with the tools, systems, and processes needed to build exceptional software at scale.
              </div>
              <div>
               <strong>Responsibilities</strong>
              </div>
              <ul>
               <li>Design and implement scalable and secure cloud infrastructure and services on AWS.</li>
               <li>Drive and accelerate the adoption of AI and large language models (LLMs) to enhance developer efficiency.</li>
               <li>Collaborate with software engineering, operations, and product teams to optimize and enhance developer workflows and build robust platform solutions.</li>
               <li>Manage infrastructure as code using tools like CDK or CloudFormation to enable automated provisioning and configuration.</li>
               <li>Monitor, troubleshoot, and resolve platform issues to ensure high system availability and performance.</li>
               <li>Analyze and improve existing platforms, identifying areas for optimization and cost efficiency.</li>
               <li>Ownership over the production operation and monitoring of the systems related to the team''s charter, including SLAs, reliability, and scalability.</li>
               <li>Stay updated on emerging technologies and trends to influence design decisions and technical strategy.</li>
               <li>Guide and support team members, fostering their technical expertise and professional development.</li>
               <li>Engage in code reviews and uphold engineering best practices by providing constructive feedback to your peers.</li>
               <li>Maintain adherence to security standards and implement industry best practices.</li>
              </ul>
              <div>
               <strong>What You Bring:</strong>
              </div>
              <ul>
               <li>4+ years of experience building, testing, and deploying applications in high-traffic production environments</li>
               <li>4+ years of experience in backend software development (ideally with Typescript and Node.js)</li>
               <li>A passion for optimizing developer experiences and empowering teams with reliable tools and systems.</li>
               <li>Thrives on taking initiative, is highly self-motivated, embraces a fast-paced approach to delivering results, and is eager to collaborate on tackling meaningful challenges.</li>
               <li>Proven experience offering detailed technical feedback and mentorship to outstanding, high-performing engineers from diverse backgrounds and with a wide range of skill sets.</li>
               <li>Skill in transforming complex, abstract problems into clear, actionable solutions.</li>
               <li>Demonstrates resilience when faced with challenges, addressing them effectively and involving others when needed. Operates with minimal supervision and direction.</li>
               <li>Effective partnerships with diverse cross-functional peers - engineers, product managers, designers, operations, and business stakeholders - at different technical levels and contribute to technical outcomes.</li>
               <li>Demonstrated expertise in designing, building, and maintaining dependable production systems. Skilled at anticipating challenges and proactively addressing critical issues.</li>
              </ul>
              <h3><br></h3>
              <h3><strong>Preferred Qualifications</strong></h3>
              <ul>
               <li>Proficiency with AWS cloud platforms and services.</li>
               <li>Experience with Infrastructure as Code tools like CDK or CloudFormation.</li>
               <li>Demonstrated ability to drive the adoption of AI/LLMs for developer efficiency.</li>
               <li>Strong understanding of developer workflows and experience in optimizing them.</li>
               <li>Background in observability tools for monitoring and troubleshooting complex systems.</li>
              </ul>
              <div>
               Join our Developer Platform Team to make a significant impact by developing innovative solutions that enhance the efficiency and experience of our engineering organization. If you are passionate about building cutting-edge software and enjoy working in a dynamic, collaborative environment, we would love to hear from you.
              </div>
              <div>
               Veho is a growth company that looks for team members to grow with it. Veho offers a generous ownership package, a casual work environment, a diverse and inclusive culture, and an electric atmosphere for professional development. No matter the location or the role, every Veho employee shares one galvanizing mission: driving commerce forward with a customer-centric delivery and returns experience that''s built for the modern era. We are deeply value-driven (Team Up, Drive Impact, Take Ownership, Solve Bigger, Obsess Over Experience, Make Today Count) and care tremendously about investing in people. We are committed to creating a diverse team and an environment that provides everyone with the opportunity to do the work of their lifetime. Veho is unable to provide sponsorship at this time.
              </div>
              <div>
               Veho is committed to nurturing, cultivating, and preserving a diverse and inclusive work environment. Empathy and respect for each other are core to our values and a central part of working here every day. The diversity of our employees, drivers, and applicants is welcomed and encouraged.
              </div>
             </div>
            </div>
            <div>
             <div>
              <div>
               <div>
                <div>
                 Ready to apply?
                </div>
                <div>
                 <div>
                  <div>
                   Powered by
                  </div><a href="https://www.gem.com"></a>
                 </div>
                </div>
               </div>
               <div>
                <div>
                 <span>First name<span> *</span></span>
                </div>
                <div>
                 <span>Last name<span> *</span></span>
                </div>
                <div>
                 <span>Email<span> *</span></span>
                </div>
                <div>
                 <span>LinkedIn URL</span>
                </div>
                <div>
                 <span>Resume<span> *</span></span>
                 <div>
                  <div>
                   <div>
                    <div>
                     <i></i><span>Click to upload or drag and drop here</span>
                    </div><em></em>
                   </div>
                  </div>
                 </div>
                </div>
                <div>
                 <div>
                  <span>Are you at least 18 years of age?<span> *</span></span>
                 </div>
                 <div>
                  <div>
                   <div>
                    <div>
                     <div>
                      <span></span>
                      <div>
                       Yes
                      </div>
                     </div>
                     <div>
                      <span></span>
                      <div>
                       No
                      </div>
                     </div>
                    </div>
                   </div>
                  </div>
                 </div>
                </div>
                <div>
                 <div>
                  <span>Please describe a technical project/workstream that you led end to end.<span> *</span></span>
                 </div>
                </div>
                <div>
                 <div>
                  <span>Do you have experience working in this tech stack? (Please check all that apply)<span> *</span></span>
                 </div>
                 <div>
                  <div>
                   <div>
                    <div>
                     <span></span>
                     <div>
                      React
                     </div>
                    </div>
                    <div>
                     <span></span>
                     <div>
                      Typescript
                     </div>
                    </div>
                    <div>
                     <span></span>
                     <div>
                      Node.js
                     </div>
                    </div>
                    <div>
                     <span></span>
                     <div>
                      AWS
                     </div>
                    </div>
                   </div>
                  </div>
                 </div>
                </div>
                <div>
                 <div>
                  <span>LinkedIn<span> *</span></span>
                 </div>
                </div>
                <div>
                 <div>
                  <span>Are you comfortable being on call for production software?<span> *</span></span>
                 </div>
                 <div>
                  <div>
                   <div>
                    <div>
                     <div>
                      <span></span>
                      <div>
                       Yes
                      </div>
                     </div>
                     <div>
                      <span></span>
                      <div>
                       No
                      </div>
                     </div>
                    </div>
                   </div>
                  </div>
                 </div>
                </div>
               </div>
               <div>
               </div>
              </div>
             </div>
            </div>
            <div>
             Req ID: R366
            </div>
           </div>
          </div>
         </div>
         <div>
          <a href="https://jobs.gem.com/veho-technologies/am9icG9zdDoXhIequOl_CQAG1WBaO2kD?utm_source=Techstars+job+board&amp;utm_medium=getro.com&amp;gh_src=Techstars+job+board">
           <div>
            <div>
             Apply now
            </div>
           </div></a>
         </div>
         <div>
          <a href="https://jobs.techstars.com/companies/veho#content">See more open positions at Veho</a>
         </div>
        </div>
       </div>
      </div>
      <div></div>
     </div>
    </div>
   </div>
   <div>
    <div>
     <a href="https://www.getro.com/getro-jobs">
      <div></div></a>
     <div>
      <a href="https://jobs.techstars.com/privacy-policy#content">Privacy policy</a><a href="https://jobs.techstars.com/cookie-policy#content">Cookie policy</a>
     </div>
    </div>
   </div>
   <div>
    <div>
     <div>
      <div>
       <div>
        <div>
         <div>
          <div>
           <div>
            <div>
             <div>
              <ul>
               <li><a href="https://www.techstars.com/contact" title="contact"><span>contact</span><span></span></a></li>
               <li><a href="https://www.techstars.com/careers" title="careers"><span>careers</span><span></span></a></li>
               <li><a href="https://www.techstars.com/newsroom" title="news"><span>news</span><span></span></a></li>
              </ul>
              <div>
               <div>
                <li><a href="https://www.facebook.com/techstars" title="Facebook"></a></li>
                <li><a href="https://www.linkedin.com/company/techstars/" title="LinkedIn"></a></li>
                <li><a href="https://www.youtube.com/user/techstarstv" title="Youtube"></a></li>
                <li><a href="https://twitter.com/techstars" title="Twitter"></a></li>
                <li><a href="https://www.instagram.com/techstars/" title="Instagram"></a></li>
               </div>
              </div>
             </div>
            </div>
           </div>
           <div>
            <div>
             <div>
              <div>
               <a href="https://www.techstars.com/startups"><span>startups</span><span></span></a><a href="https://www.techstars.com/accelerators" title="accelerators"><span>
                 <h6>accelerators</h6></span><span></span></a><a href="https://www.techstars.com/portfolio" title="portfolio"><span>
                 <h6>portfolio</h6></span><span></span></a><a href="https://www.techstars.com/general-interest" title="learn more &amp; apply"><span>
                 <h6>learn more &amp; apply</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/corporations"><span>corporations</span><span></span></a><a href="https://www.techstars.com/accelerator-partnership/" title="accelerator partnership"><span>
                 <h6>accelerator partnership</h6></span><span></span></a><a href="https://www.techstars.com/network-engagement/" title="network engagement"><span>
                 <h6>network engagement</h6></span><span></span></a><a href="https://www.techstars.com/innovation-bootcamp/" title="innovation bootcamp"><span>
                 <h6>innovation bootcamp</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/communities"><span>communities</span><span></span></a><a href="https://www.techstars.com/ecosystem-development" title="ecosystem development"><span>
                 <h6>ecosystem development</h6></span><span></span></a><a href="https://startupweekend.org/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweekend.org"><span>
                 <h6>startupweekend.org</h6></span><span></span></a><a href="https://startupweek.co/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupweek.co"><span>
                 <h6>startupweek.co</h6></span><span></span></a><a href="https://www.startupdigest.com/?__hstc=174924861.3ee6df97730d48710ad3e02aa900e24f.1586806421796.1586806421797.1586806421797.1&amp;__hssc=174924861.1.1586806421797&amp;__hsfp=498573810" title="startupdigest.com"><span>
                 <h6>startupdigest.com</h6></span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/investors"><span>investors</span><span></span></a>
              </div>
              <div>
               <a href="https://www.techstars.com/mission"><span>mission</span><span></span></a><a href="https://www.techstars.com/code-of-conduct" title="code of conduct"><span>
                 <h6>code of conduct</h6></span><span></span></a><a href="http://diversity.techstars.com/" title="diversity &amp; inclusion"><span>
                 <h6>diversity &amp; inclusion</h6></span><span></span></a><a href="http://diversity.techstars.com/foundation" title="Techstars Foundation"><span>
                 <h6>Techstars Foundation</h6></span><span></span></a>
              </div>
              <div>
               <p>resources</p><a href="https://www.techstars.com/faq/" title="faq"><span>
                 <h6>faq</h6></span><span></span></a><a href="https://www.techstars.com/contact" title="contact"><span>
                 <h6>contact</h6></span><span></span></a><a href="https://brandguide.brandfolder.com/techstars/" title="brand guidelines"><span>
                 <h6>brand guidelines</h6></span><span></span></a>
              </div>
             </div>
            </div>
            <div>
             <div>
              <h6>© techstars 2024<span>|</span><a href="https://www.techstars.com/privacy-policy"><span>privacy policy</span><span></span></a><span>|</span><a href="https://www.techstars.com/terms-of-use"><span>terms of use</span><span></span></a></h6>
             </div>
             <div>
              <div>
               <img src="https://cdn-customers.getro.com/techstars/images/bcorpcert.png">
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</div>', NOW());
SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;
-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.
INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES ('Bogotá, Bogota, Colombia', NULL, NULL, 'Bogotá, Bogota, Colombia', (SELECT * FROM last_id));
INSERT INTO tag (name, job_posting_id) VALUES ('Remote', (SELECT * FROM last_id));
DROP TABLE last_id;

