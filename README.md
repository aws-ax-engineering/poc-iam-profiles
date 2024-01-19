# poc-iam-profiles.

This pipeline manages:  

**Product service accounts**  
Two service accounts (machine users) are defined for use in the Engineering Platform teams AWS IAM-based identity pipelines. The service accounts in general do not have any permission policies assigned directly but are instead added to either the non-production or the production Group as appropriate. The groups have policies attached that enable assumption of any POCRoles in the product accounts.  

_need to redraw diagrams for legato poc_
main.tf  

<div align="center">
	<img alt="architecture1.png" src="https://github.com/amex-engineering/poc-iam-profiles/raw/main/doc/architecture1.png" width=800 />
</div>

**Pipeline Roles (permissions)**  

Each pipeline role has a matching, named role file.  
<div align="center">
	<img alt="architecture2.png" src="https://github.com/amex-engineering/poc-iam-profiles/raw/main/doc/architecture2.png" width=800 />
</div>

### about access permissions  

In general, it is only the Engineering Platform product development team(s) that will have direct access to the product AWS accounts. Customers of the platform will not have AWS IAM identities but rather will have access defined and maintained as part of the overall product capabilities, through an external idp.  

Even though EP product team members have direct access, apart from the Development account, you should not expect to see actual human write-access taking place. All change is brought about through software-defined process and via a service account persona.  

As you can see from the above diagram, account level roles are ubiquitous. Each account used by the product has the same set of roles defined. A service account's group membership then determines which accounts in which the svc identity may assume any role.  

Maintainer notes found [here](doc/maintainer_notes.md).
