# Welcome to NeutrosophyLib! Pura Vida!!

**NeutrosophyLib** is a Solidity library (_work in progress_) developed by **Satisfied Vagabonds**, from Costa Rica's jungle to the world. 

Is Neutrosophy new for you? Don’t worry! read this post [ Neutrosophy as a tool to navigate a convex-concave world ]( https://medium.com/@ranulfo17/neutrosophy-as-a-tool-to-navigate-a-hybrid-convex-concave-world-50a3f1c9b3ff). 
Or, read this brief introduction.

Through NeutrosophyLib we aim to introduce **Neutrosophy** to the Web3 community because we think it can help us to navigate in a world, accordingly **Vitalik Buterin**:

> “…the world is not entirely convex, but it is not entirely concave either. But the existence of some concave path between any two distant positions A and B is very likely, and if you can find that path then you can often find a synthesis between the two positions that is better than both…”
(https://vitalik.ca/general/2020/11/08/concave.html)

Neutrosophy is a modern and powerful - philosophy, and mathematics - created in the 90s by __Prof. Florentin Smarandache__. Neutrosophy helps us see the world beyond the lens of polarizing logic. By polarizing logic, we mean:
> ... a logic induces people to categorize something between belonging, or not belonging to a set. Also, it does not allow a person, or group, to express the level of indeterminacy, or, the level of “I don’t know if that thing belongs or doesn’t belong…” [Neutrosophy as a tool to navigate a hybrid convex-concave world]( https://medium.com/@ranulfo17/neutrosophy-as-a-tool-to-navigate-a-hybrid-convex-concave-world-50a3f1c9b3ff)

Neutrosophy allows us to express, simultaneously, our opinion regarding something considering:
- our degree of agreement, and,
- our degree of indecision (indeterminacy), and,
- our degree of disagreement.

For example, in a voting process influenced by polarizing logic, we vote FOR or AGAINST something, and if we do not want to express our opinion we ABSTAIN (Figure 1A). 

Sometimes we face situations where we agree and disagree with a proposal partially, and, at the same time, we have a doubt regarding it. For example, given a proposal, let us suppose we agree 40%, have doubt (90%) and disagree (10%). In this case, a voting process influenced by Neutrosophy (Figure 1B) allows us to explicit our thoughts clearer and more transparent.




### Figure 1 - Voting systems influenced by (A) polarizing logic, and, (B) Neutrosophy

![voting](https://github.com/SatisfiedVagabonds/NeutrosophyLib/assets/20327372/bbbe7408-8c38-4afe-ae58-81c190cb06cd)

Neutrosophy has three components, in Figure 1B, represented as (For, Undecided, Against) while polarizing logic has two, in Figure 1A, represented as (For, Against). In both cases, the Abstain is present, allowing those who do not want to express their opinion.

For more information, read this post [ Neutrosophy as a tool to navigate a convex-concave world ]( https://medium.com/@ranulfo17/neutrosophy-as-a-tool-to-navigate-a-hybrid-convex-concave-world-50a3f1c9b3ff).

In this library, NeutrosophyLib, we introduce basic neutrosophic operations detailed in 
[NeutrosophyLib basic operations](NeutrosophyLib_basic_operations_v1.pdf).

We intend to publish some prototypes of applications using NeutrosophyLib soon.

___


## Our gratitude
To [Patrick Collins]( https://www.youtube.com/@PatrickAlphaC) and Cromewar for sharing with the community so valuable learnings regarding DAO Governance, and smart contract development. To Vitalik for sharing your provocative visions regarding DAO Governance in your [blog posts]( https://vitalik.ca/general/2020/11/08/concave.html).  We also thank [Cambiatus]( https://cambiatus.com) team for embracing Neutrosophy math as a useful tool for decentralized governance during our Cambiatus learning sessions. I also thank [ReFi Costa Rica]( https://twitter.com/ReFiCostaRica) and [ReFiDAO]( https://blog.refidao.com/visiting-refi-costa-rica/) for hearing about the potential uses of Neutrosophy to build innovative financial instruments in Regenerative Finance (ReFi).



We express, in advance, our gratitude for all contributions to making the code better than it is now.

___

# Getting Started
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

  - You'll know you did it right if you can run git --version and you see a response like git version x.x.x
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run forge --version and you see a response like forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)

___

# Quickstart
git clone https://github.com/SatisfiedVagabonds/NeutrosophyLib

cd NeutrosophyLib

forge build

___
# Testing

We tested the following Neutrosophic operations, which are detailed in 
[NeutrosophyLib basic operations](NeutrosophyLib_basic_operations_v1.pdf). They are:

1. isContained
2. isEqual
3. union
4. intersection
5. complement
6. difference
7. addSVNN
8. multiplySVNN
9. ScoreSVNN
10. AccuracySVNN
11. DeneutrosophySVNN
12. Other functions and applications (COMING SOON)

You can test all:

> forge test

or, you can test each function individually:

> forge test --match-test functionName -vvv
___

# Estimate Gas

You can estimate how much gas things cost by running:

> forge snapshot

And you'll see an output file called **.gas-snapshot**
___

# Formatting
To run code formatting:
> forge fmt
___
# Thank You
We hope you like this material!

___
# Feel free to support
- You can support improving the code

- Donate ETH or other cryptoassets:
0x65F00A4DbBBdefc5b17f58b511dE208766911d19
___

