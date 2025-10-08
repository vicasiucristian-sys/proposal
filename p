import React from 'react';
import { CheckCircle, XCircle, TrendingUp, Users, Shield, Book, Calendar, Target, Award, AlertCircle } from 'lucide-react';

export default function TradingEbookProposal() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white">
      <div className="max-w-5xl mx-auto px-6 py-12">
        {/* Header */}
        <div className="text-center mb-12">
          <div className="inline-block bg-emerald-500/20 text-emerald-400 px-4 py-2 rounded-full text-sm font-semibold mb-4">
            CONVERSION OPTIMIZATION PROPOSAL
          </div>
          <h1 className="text-4xl md:text-5xl font-bold mb-4 bg-gradient-to-r from-emerald-400 to-blue-400 bg-clip-text text-transparent">
            Sales Page Redesign Proposal
          </h1>
          <p className="text-xl text-slate-300">
            Smart Money Manipulation: Trading Ebook
          </p>
          <p className="text-slate-400 mt-2">Based on competitor analysis of TJR Trades event page</p>
        </div>

        {/* Executive Summary */}
        <section className="bg-slate-800/50 backdrop-blur border border-slate-700 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-4 flex items-center gap-2">
            <TrendingUp className="text-emerald-400" />
            Executive Summary
          </h2>
          <p className="text-slate-300 mb-4">
            Your current Payhip page is converting poorly due to lack of professional design, credibility signals, 
            and persuasive copy structure. Based on analysis of TJR Trades' high-converting event page, 
            we've identified 15+ critical improvements that could increase conversions by 300-500%.
          </p>
          <div className="grid md:grid-cols-3 gap-4 mt-6">
            <div className="bg-red-500/10 border border-red-500/30 rounded-xl p-4">
              <div className="text-red-400 font-bold text-2xl mb-1">Current</div>
              <div className="text-slate-300">Basic Payhip template</div>
              <div className="text-slate-400 text-sm">Est. 1-2% conversion</div>
            </div>
            <div className="bg-emerald-500/10 border border-emerald-500/30 rounded-xl p-4">
              <div className="text-emerald-400 font-bold text-2xl mb-1">Proposed</div>
              <div className="text-slate-300">Optimized sales page</div>
              <div className="text-slate-400 text-sm">Target: 5-10% conversion</div>
            </div>
            <div className="bg-blue-500/10 border border-blue-500/30 rounded-xl p-4">
              <div className="text-blue-400 font-bold text-2xl mb-1">ROI</div>
              <div className="text-slate-300">3-5x more sales</div>
              <div className="text-slate-400 text-sm">Same traffic volume</div>
            </div>
          </div>
        </section>

        {/* Current Problems */}
        <section className="bg-slate-800/50 backdrop-blur border border-slate-700 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <XCircle className="text-red-400" />
            Critical Issues with Current Page
          </h2>
          <div className="space-y-4">
            {[
              'No credibility indicators - Missing author bio, credentials, track record',
              'Weak headline - Unrealistic promise ("Never Lose Money Again") reduces trust',
              'No social proof - Zero testimonials, student count, or success stories',
              'Poor visual hierarchy - Text-heavy, no clear sections or flow',
              'Missing urgency/scarcity - No limited-time offers or countdown timers',
              'No risk reversal - No money-back guarantee displayed',
              'Generic design - Payhip template looks unprofessional and cheap',
              'No value demonstration - Missing book preview, table of contents, sample pages',
              'Vague benefits - Doesn\'t specify what readers will actually learn',
              'No pricing psychology - Single price point with no anchoring or bonuses',
              'Missing trust signals - No secure payment badges or satisfied customer logos',
              'Poor mobile experience - Not optimized for mobile conversions'
            ].map((issue, idx) => (
              <div key={idx} className="flex items-start gap-3 p-4 bg-red-500/5 border border-red-500/20 rounded-lg">
                <XCircle className="text-red-400 mt-1 flex-shrink-0" size={20} />
                <p className="text-slate-300">{issue}</p>
              </div>
            ))}
          </div>
        </section>

        {/* What TJR Does Right */}
        <section className="bg-slate-800/50 backdrop-blur border border-slate-700 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <CheckCircle className="text-emerald-400" />
            What TJR Trades Does Right (To Model)
          </h2>
          <div className="grid md:grid-cols-2 gap-4">
            {[
              {
                icon: <Target className="text-emerald-400" />,
                title: 'Strong Opening Hook',
                desc: '"Generated $446k+ this month" - Specific, credible proof point'
              },
              {
                icon: <Calendar className="text-blue-400" />,
                title: 'Event Scarcity',
                desc: 'Countdown timer + "Early Bird Pricing Ending" creates urgency'
              },
              {
                icon: <Users className="text-purple-400" />,
                title: 'Authority Building',
                desc: 'Featured multiple expert speakers with credentials and photos'
              },
              {
                icon: <Book className="text-yellow-400" />,
                title: 'Clear Structure',
                desc: 'Day-by-day breakdown of what attendees learn'
              },
              {
                icon: <Shield className="text-green-400" />,
                title: 'Risk Reversal',
                desc: 'Prominent "No-Questions-Asked Refund Guarantee"'
              },
              {
                icon: <Award className="text-orange-400" />,
                title: 'Tiered Pricing',
                desc: '$47 vs $97 VIP creates value perception and upsell'
              }
            ].map((item, idx) => (
              <div key={idx} className="bg-slate-700/30 border border-slate-600 rounded-xl p-5">
                <div className="flex items-center gap-3 mb-2">
                  {item.icon}
                  <h3 className="font-bold text-white">{item.title}</h3>
                </div>
                <p className="text-slate-300 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Recommendations */}
        <section className="bg-gradient-to-br from-emerald-500/10 to-blue-500/10 border border-emerald-500/30 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <TrendingUp className="text-emerald-400" />
            Detailed Recommendations
          </h2>
          
          {/* Recommendation 1 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">1. Redesign Above-the-Fold Section</h3>
            <div className="bg-slate-800/50 rounded-xl p-6 space-y-3">
              <p className="text-slate-300"><strong>Current:</strong> Generic product image + vague promise</p>
              <p className="text-slate-300"><strong>Proposed:</strong></p>
              <ul className="list-disc list-inside space-y-2 text-slate-300 ml-4">
                <li>Headline: "The Exact Smart Money Strategy That Helped [X] Traders Generate Consistent Profits"</li>
                <li>Subheadline: Specific outcome + timeframe (e.g., "Master Smart Money Concepts in 7 Days")</li>
                <li>Proof point: "200+ Pages of Battle-Tested Trading Strategies"</li>
                <li>Countdown timer: "Limited Launch Price - Ends in [countdown]"</li>
                <li>Primary CTA: "Get Instant Access Now - $27 → $17 (Launch Special)"</li>
              </ul>
            </div>
          </div>

          {/* Recommendation 2 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">2. Add Credibility Section</h3>
            <div className="bg-slate-800/50 rounded-xl p-6 space-y-3">
              <p className="text-slate-300"><strong>Include:</strong></p>
              <ul className="list-disc list-inside space-y-2 text-slate-300 ml-4">
                <li>Author bio with professional photo</li>
                <li>Trading credentials/experience (years trading, account size, win rate)</li>
                <li>Student success count: "4,000+ traders trained" (like TJR)</li>
                <li>Social proof bar: "[X] copies sold | [Y] 5-star reviews"</li>
              </ul>
            </div>
          </div>

          {/* Recommendation 3 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">3. Create "What You'll Learn" Section</h3>
            <div className="bg-slate-800/50 rounded-xl p-6 space-y-3">
              <p className="text-slate-300"><strong>Model TJR's day-by-day breakdown with modules:</strong></p>
              <ul className="list-disc list-inside space-y-2 text-slate-300 ml-4">
                <li>Module 1: Understanding Smart Money Concepts (with specific chapter names)</li>
                <li>Module 2: Identifying Market Manipulation Patterns</li>
                <li>Module 3: Entry & Exit Strategies</li>
                <li>Module 4: Risk Management That Actually Works</li>
                <li>Module 5: Trading Psychology & Mindset</li>
                <li>Use icons and visual hierarchy like TJR's page</li>
              </ul>
            </div>
          </div>

          {/* Recommendation 4 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">4. Add Cost/Benefit Comparison</h3>
            <div className="bg-slate-800/50 rounded-xl p-6">
              <p className="text-slate-300 mb-3"><strong>Copy TJR's "Cost of Doing Nothing" section:</strong></p>
              <div className="grid md:grid-cols-2 gap-4">
                <div className="bg-emerald-500/10 border border-emerald-500/30 rounded-lg p-4">
                  <div className="font-bold text-emerald-400 mb-2">With This Book ✓</div>
                  <ul className="text-sm text-slate-300 space-y-1">
                    <li>• Learn proven strategies in 7 days</li>
                    <li>• Avoid costly beginner mistakes</li>
                    <li>• Understand institutional trader tactics</li>
                  </ul>
                </div>
                <div className="bg-red-500/10 border border-red-500/30 rounded-lg p-4">
                  <div className="font-bold text-red-400 mb-2">Without This Book ✗</div>
                  <ul className="text-sm text-slate-300 space-y-1">
                    <li>• Continue losing money to "smart money"</li>
                    <li>• Waste months testing random strategies</li>
                    <li>• Join the 98% who fail at trading</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          {/* Recommendation 5 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">5. Add Testimonials Section</h3>
            <div className="bg-slate-800/50 rounded-xl p-6 space-y-3">
              <ul className="list-disc list-inside space-y-2 text-slate-300 ml-4">
                <li>Collect 5-10 testimonials from early readers</li>
                <li>Include photos, names, and specific results</li>
                <li>Format: "[Specific result achieved] - John D., Full-time Trader"</li>
                <li>Add video testimonials if possible (huge trust booster)</li>
              </ul>
            </div>
          </div>

          {/* Recommendation 6 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">6. Create Tiered Pricing</h3>
            <div className="bg-slate-800/50 rounded-xl p-6">
              <p className="text-slate-300 mb-4"><strong>Model TJR's pricing structure:</strong></p>
              <div className="grid md:grid-cols-2 gap-4">
                <div className="bg-slate-700/50 border border-slate-600 rounded-lg p-5">
                  <div className="text-slate-400 text-sm mb-1">Standard Package</div>
                  <div className="text-2xl font-bold mb-3">$17</div>
                  <ul className="text-sm text-slate-300 space-y-2">
                    <li>✓ Complete 200-page ebook (PDF)</li>
                    <li>✓ Smart Money Concepts guide</li>
                    <li>✓ Trading strategy templates</li>
                  </ul>
                </div>
                <div className="bg-gradient-to-br from-emerald-500/20 to-blue-500/20 border-2 border-emerald-500 rounded-lg p-5 relative">
                  <div className="absolute -top-3 left-1/2 -translate-x-1/2 bg-emerald-500 text-white text-xs font-bold px-3 py-1 rounded-full">
                    MOST POPULAR
                  </div>
                  <div className="text-slate-400 text-sm mb-1">VIP Package</div>
                  <div className="text-2xl font-bold mb-3">$47</div>
                  <ul className="text-sm text-slate-300 space-y-2">
                    <li>✓ Everything in Standard</li>
                    <li>✓ Video course companion (5 modules)</li>
                    <li>✓ Trading cheat sheets & checklists</li>
                    <li>✓ Private Discord community access</li>
                    <li>✓ Monthly live Q&A sessions</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          {/* Recommendation 7 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">7. Add Prominent Guarantee</h3>
            <div className="bg-slate-800/50 rounded-xl p-6">
              <p className="text-slate-300 mb-3"><strong>Copy TJR's guarantee format:</strong></p>
              <div className="bg-gradient-to-r from-emerald-500/10 to-blue-500/10 border border-emerald-500/30 rounded-xl p-6 text-center">
                <div className="w-16 h-16 mx-auto bg-emerald-500/20 rounded-full flex items-center justify-center mb-4">
                  <Shield className="text-emerald-400" size={32} />
                </div>
                <h4 className="text-xl font-bold mb-2">30-Day Money-Back Guarantee</h4>
                <p className="text-slate-300">
                  Read the entire book. Apply the strategies. If you don't see improvement in your trading within 30 days, 
                  email us for a full refund - no questions asked.
                </p>
              </div>
            </div>
          </div>

          {/* Recommendation 8 */}
          <div className="mb-8">
            <h3 className="text-xl font-bold text-emerald-400 mb-3">8. Add FAQ Section</h3>
            <div className="bg-slate-800/50 rounded-xl p-6">
              <p className="text-slate-300 mb-3"><strong>Include 8-10 FAQs like TJR:</strong></p>
              <ul className="list-disc list-inside space-y-2 text-slate-300 ml-4">
                <li>"I've never traded before. Is this book for beginners?"</li>
                <li>"What if I'm already an experienced trader?"</li>
                <li>"How is this different from free YouTube content?"</li>
                <li>"What format is the ebook? Can I read on mobile?"</li>
                <li>"Do I need any special software to start?"</li>
                <li>"How long will it take to read?"</li>
              </ul>
            </div>
          </div>
        </section>

        {/* Technical Implementation */}
        <section className="bg-slate-800/50 backdrop-blur border border-slate-700 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <AlertCircle className="text-blue-400" />
            Platform & Technical Recommendations
          </h2>
          
          <div className="space-y-6">
            <div>
              <h3 className="font-bold text-white mb-3">Option 1: Gumroad (Recommended for Speed)</h3>
              <div className="bg-slate-700/30 rounded-lg p-5">
                <ul className="space-y-2 text-slate-300">
                  <li>✓ <strong>Cost:</strong> 10% + $0.50 per sale</li>
                  <li>✓ <strong>Setup time:</strong> 1-2 days</li>
                  <li>✓ <strong>Pros:</strong> Better customization than Payhip, customer emails, analytics</li>
                  <li>✓ <strong>Best for:</strong> Quick launch with moderate budget</li>
                </ul>
              </div>
            </div>

            <div>
              <h3 className="font-bold text-white mb-3">Option 2: Custom Landing Page + Stripe (Best ROI)</h3>
              <div className="bg-slate-700/30 rounded-lg p-5">
                <ul className="space-y-2 text-slate-300">
                  <li>✓ <strong>Cost:</strong> ~$300-500 setup + 2.9% Stripe fees</li>
                  <li>✓ <strong>Setup time:</strong> 1-2 weeks</li>
                  <li>✓ <strong>Pros:</strong> Full control, professional design, highest conversions</li>
                  <li>✓ <strong>Best for:</strong> Long-term sales, multiple products</li>
                  <li>✓ <strong>Platforms:</strong> Framer (like TJR uses), Webflow, or custom React</li>
                </ul>
              </div>
            </div>

            <div>
              <h3 className="font-bold text-white mb-3">Option 3: Teachable</h3>
              <div className="bg-slate-700/30 rounded-lg p-5">
                <ul className="space-y-2 text-slate-300">
                  <li>✓ <strong>Cost:</strong> $49/month + 5% transaction fee</li>
                  <li>✓ <strong>Setup time:</strong> 3-5 days</li>
                  <li>✓ <strong>Pros:</strong> Professional course platform, built-in marketing</li>
                  <li>✓ <strong>Best for:</strong> If planning video courses later</li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        {/* Investment & Timeline */}
        <section className="bg-gradient-to-br from-blue-500/10 to-purple-500/10 border border-blue-500/30 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6">Investment & Timeline</h2>
          
          <div className="grid md:grid-cols-3 gap-6 mb-8">
            <div className="bg-slate-800/50 rounded-xl p-6">
              <div className="text-emerald-400 font-bold text-sm mb-2">BUDGET OPTION</div>
              <div className="text-3xl font-bold mb-4">$0-100</div>
              <ul className="text-sm text-slate-300 space-y-2">
                <li>• DIY on Gumroad</li>
                <li>• 2-3 days setup</li>
                <li>• Good for validation</li>
              </ul>
            </div>
            <div className="bg-slate-800/50 rounded-xl p-6 border-2 border-emerald-500">
              <div className="text-emerald-400 font-bold text-sm mb-2">RECOMMENDED</div>
              <div className="text-3xl font-bold mb-4">$500-1k</div>
              <ul className="text-sm text-slate-300 space-y-2">
                <li>• Professional designer</li>
                <li>• Custom Framer page</li>
                <li>• 1-2 weeks setup</li>
                <li>• Best ROI</li>
              </ul>
            </div>
            <div className="bg-slate-800/50 rounded-xl p-6">
              <div className="text-blue-400 font-bold text-sm mb-2">PREMIUM</div>
              <div className="text-3xl font-bold mb-4">$2k-5k</div>
              <ul className="text-sm text-slate-300 space-y-2">
                <li>• Full funnel design</li>
                <li>• Copywriter + designer</li>
                <li>• Video production</li>
                <li>• 3-4 weeks</li>
              </ul>
            </div>
          </div>
        </section>

        {/* Expected Results */}
        <section className="bg-slate-800/50 backdrop-blur border border-slate-700 rounded-2xl p-8 mb-8">
          <h2 className="text-2xl font-bold mb-6">Expected Results</h2>
          
          <div className="space-y-4">
            <div className="bg-gradient-to-r from-emerald-500/10 to-transparent border-l-4 border-emerald-500 p-5 rounded-r-lg">
              <div className="font-bold text-white mb-2">Current Performance (Estimated)</div>
              <div className="text-slate-300">100 visitors → 1-2 sales/month → $27-54 revenue</div>
            </div>
            
            <div className="bg-gradient-to-r from-blue-500/10 to-transparent border-l-4 border-blue-500 p-5 rounded-r-lg">
              <div className="font-bold text-white mb-2">After Basic Improvements</div>
              <div className="text-slate-300">100 visitors → 5-8 sales/month → $135-216 revenue</div>
              <div className="text-emerald-400 text-sm mt-1">3-4x improvement</div>
            </div>
            
            <div className="bg-gradient-to-r from-purple-500/10 to-transparent border-l-4 border-purple-500 p-5 rounded-r-lg">
              <div className="font-bold text-white mb-2">After Full Optimization</div>
              <div className="text-slate-300">100 visitors → 10-15 sales/month → $270-405 revenue</div>
              <div className="text-emerald-400 text-sm mt-1">5-7x improvement (assuming VIP package upsells)</div>
            </div>
          </div>
        </section>

        {/* Next Steps */}
        <section className="bg-gradient-to-br from-emerald-500/20 to-blue-500/20 border-2 border-emerald-500 rounded-2xl p-8">
          <h2 className="text-2xl font-bold mb-6">Recommended Next Steps</h2>
          
          <div className="space-y-4">
            {[
              { num: '1', text: 'Gather social proof - Reach out to anyone who bought the ebook for testimonials', time: 'Week 1' },
              { num: '2', text: 'Create author bio & credentials section - Build authority', time: 'Week 1' },
              { num: '3', text: 'Write detailed "What You\'ll Learn" section with module breakdown', time: 'Week 1-2' },
              { num: '4', text: 'Choose platform (recommend Gumroad for speed or Framer for best results)', time: 'Week 2' },
              { num: '5', text: 'Design new sales page implementing all recommendations', time: 'Week 2-3' },
              { num: '6', text: 'Create VIP package with bonuses (video modules, templates, community)', time: 'Week 3' },
              { num: '7', text: 'Set up tracking (Google Analytics, conversion pixels)', time: 'Week 3' },
              { num: '8', text: 'Launch with limited-time pricing to create urgency', time: 'Week 4' },
              { num: '9', text: 'A/B test different headlines, prices, and CTAs', time: 'Ongoing' }
            ].map((step) => (
              <div key={step.num} className="flex items-start gap-4 bg-slate-800/50 rounded-lg p-4">
                <div className="bg-emerald-500 text-white font-bold rounded-full w-8 h-8 flex items-center justify-center flex-shrink-0">
                  {step.num}
                </div>
                <div className="flex-1">
                  <p className="text-white font-medium">{step.text}</p>
                  <p className="text-slate-400 text-sm mt-1">{step.time}</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Footer */}
        <div className="text-center mt-12 text-slate-400 text-sm">
          <p>This proposal is based on industry best practices and competitor analysis.</p>
          <p className="mt-2">Questions? Let's discuss implementation strategy and timeline.</p>
        </div>
      </div>
    </div>
  );
}
