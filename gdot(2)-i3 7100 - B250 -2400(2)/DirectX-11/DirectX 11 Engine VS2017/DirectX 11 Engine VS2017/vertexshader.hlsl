cbuffer mycBuffer : register(b0)
{
    float4x4 mat;
	float4x4 mac;
	float4x4 map[2];
}; 

struct VS_INPUT
{
    float3 inPos : POSITION;
    float2 inTexCoord : TEXCOORD;
	float inBone : BONES;
};

struct VS_OUTPUT
{
    float4 outPosition : SV_POSITION;
    float2 outTexCoord : TEXCOORD;
};

VS_OUTPUT main(VS_INPUT input) 
{
    VS_OUTPUT output;
	switch (input.inBone)
	{
	case 0.0f:
		output.outPosition = mul(float4(input.inPos, 1.0f), mac);
		break;
	case 1.0f:
		float4 bnt = mul(float4(input.inPos, 1.0f), mac);
		output.outPosition = mul(bnt, mat);
		break;
	case 2.0f:
		float4 bn = mul(float4(input.inPos, 1.0f), map[0]);
		output.outPosition = mul(bn, mat);
		break;
	default:
		output.outPosition = mul(float4(input.inPos, 1.0f), mat);
		break;
	}
	output.outTexCoord = input.inTexCoord;
	return output;
}